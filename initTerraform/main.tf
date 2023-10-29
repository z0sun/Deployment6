##### PROVIDER ###########
provider "aws" {
  region     = "us-east-1"
  secret_key = var.secret_key
  access_key = var.access_key
}

provider "aws" {
  alias      = "west"
  region     = "us-west-2"
  secret_key = var.secret_key
  access_key = var.access_key
}


############### VPC/SECURITY GROUPs EAST ######################
resource "aws_vpc" "d6_vpc_east" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "d6_vpc_east"
  }
}
# # #      WEST 
resource "aws_vpc" "d6_vpc_west" {
  provider         = aws.west
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "d6_vpc_west"
  }
}

############ SUBNETs EAST #######
resource "aws_subnet" "publicsub_az1b" {
  vpc_id                  = aws_vpc.d6_vpc_east.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "publicsub_az1b"
  }
}

resource "aws_subnet" "publicsub_az1c" {
  vpc_id                  = aws_vpc.d6_vpc_east.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "publicsub_az1c"
  }
}

# # # # # WEST
resource "aws_subnet" "publicsub_az2a" {
  provider                = aws.west
  vpc_id                  = aws_vpc.d6_vpc_west.id
  cidr_block              = "10.1.3.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "publicsub_az2a"
  }
}

resource "aws_subnet" "publicsub_az2b" {
  provider                = aws.west
  vpc_id                  = aws_vpc.d6_vpc_west.id
  cidr_block              = "10.1.4.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "publicsub_az2b"
  }
}

############# SECURITY GROUPS ##########
resource "aws_security_group" "security6east" {
  vpc_id = aws_vpc.d6_vpc_east.id
  tags = {
    Name = "security6east"

  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# # # # WEST ####
resource "aws_security_group" "security6west" {
  provider = aws.west
  vpc_id   = aws_vpc.d6_vpc_west.id
  tags = {
    Name = "security6west"

  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

######## INSTANCEs EAST  ##############
resource "aws_instance" "Instance1-east" {
  ami                         = "ami-0fc5d935ebf8bc3bc"
  instance_type               = var.ec2_type
  subnet_id                   = aws_subnet.publicsub_az1b.id
  vpc_security_group_ids      = [aws_security_group.security6east.id]
  user_data                   = file("${path.module}/appsetup.sh")
  availability_zone           = "us-east-1b"
  key_name                    = "Deploy6key"
  associate_public_ip_address = true
  tags                        = var.ec2_1tag
}

resource "aws_instance" "Instance2-east" {
  ami                         = "ami-0fc5d935ebf8bc3bc"
  instance_type               = var.ec2_type
  subnet_id                   = aws_subnet.publicsub_az1c.id
  vpc_security_group_ids      = [aws_security_group.security6east.id]
  user_data                   = file("${path.module}/appsetup.sh")
  availability_zone           = "us-east-1c"
  key_name                    = "Deploy6key"
  associate_public_ip_address = true
  tags                        = var.ec2_2tag
}

# # ## WEST ### 

resource "aws_instance" "Instance1-west" {
  provider                    = aws.west
  ami                         = "ami-0efcece6bed30fd98"
  instance_type               = var.ec2_type
  subnet_id                   = aws_subnet.publicsub_az2a.id
  vpc_security_group_ids      = [aws_security_group.security6west.id]
  user_data                   = file("${path.module}/appsetup.sh")
  availability_zone           = "us-west-2a"
  key_name                    = "Deploy6key"
  associate_public_ip_address = true
  tags = {
    Name = "BankappWEST1"
  }
}

resource "aws_instance" "Instance2-west" {
  provider                    = aws.west
  ami                         = "ami-0efcece6bed30fd98"
  instance_type               = var.ec2_type
  subnet_id                   = aws_subnet.publicsub_az2b.id
  vpc_security_group_ids      = [aws_security_group.security6west.id]
  user_data                   = file("${path.module}/appsetup.sh")
  availability_zone           = "us-west-2b"
  key_name                    = "Deploy6key"
  associate_public_ip_address = true
  tags = {
    Name = "BankappWEST1"
  }
}

############# ROUTE TABLE ############
resource "aws_route_table" "route_deploy6east" {
  vpc_id = aws_vpc.d6_vpc_east.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.deploy6gweast.id
  }
  tags = {
    Name = "d6_route_east"
  }
}

### WEST ####
resource "aws_route_table" "route_deploy6west" {
  provider = aws.west
  vpc_id   = aws_vpc.d6_vpc_west.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.deploy6gwwest.id
  }
  tags = {
    Name = "d6_route_west"
  }
}

####### INTERNET GATEWAY ################
resource "aws_internet_gateway" "deploy6gweast" {
  vpc_id = aws_vpc.d6_vpc_east.id

  tags = {
    Name = "d6_gate_east"
  }
}

#### WEST ## 
resource "aws_internet_gateway" "deploy6gwwest" {
  vpc_id   = aws_vpc.d6_vpc_west.id
  provider = aws.west
  tags = {
    Name = "d6_gate_west"
  }
}

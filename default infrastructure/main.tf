##### PROVIDER ###########
provider "aws" {
  region     = "us-east-1"
  secret_key = var.secret_key
  access_key = var.access_key
}

############# ROUTE TABLE ############
resource "aws_route_table" "route_d6" {
  vpc_id = aws_vpc.mainvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "d6route"
  }
}
####### INTERNET GATEWAY ################
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.mainvpc.id

  tags = {
    Name = "internet gated6"
  }
}
############### VPC/SECURITY GROUPs ######################
resource "aws_vpc" "mainvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "mainvpc"
  }
}

resource "aws_security_group" "default" {
  vpc_id = aws_vpc.mainvpc.id
  tags = {
    Name = "defaultsecurity6"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8081
    to_port     = 8081
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

############ SUBNET #######
resource "aws_subnet" "publicsub_az1a" {
  vpc_id                  = aws_vpc.mainvpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "publicsub_az1a"
  }
}

######## INSTANCE ##############
resource "aws_instance" "jenkinsManager-east" {
  ami                         = "ami-0fc5d935ebf8bc3bc"
  instance_type               = var.ec2_type
  subnet_id                   = aws_subnet.publicsub_az1a.id
  vpc_security_group_ids      = [aws_security_group.default.id]
  user_data                   = file("${path.module}/ud_jc_.sh")
  availability_zone           = "us-east-1a"
  key_name                    = var.key_pair
  associate_public_ip_address = true
  tags                        = var.ec2_1tag
}

resource "aws_instance" "jenkinsAgent-east" {
  ami                         = "ami-0fc5d935ebf8bc3bc"
  instance_type               = var.ec2_type
  subnet_id                   = aws_subnet.publicsub_az1a.id
  vpc_security_group_ids      = [aws_security_group.default.id]
  user_data                   = file("${path.module}/ud_ja_tf.sh")
  availability_zone           = "us-east-1a"
  key_name                    = var.key_pair
  associate_public_ip_address = true
  tags                        = var.ec2_2tag
}

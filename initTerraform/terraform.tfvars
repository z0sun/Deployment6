# ##### PROVIDER ######
aws_access_key = ""
aws_secret_key = ""
region     = "us-east-1"
region_tag = {
  "name" = "us-east-1"
}
key_pair = "JosephWhite513key"


######## VPC #####
instance_tenancy  = "default"
dns               = "true"
vpc_cidr_block    = "10.0.0.0/16"
availability_zone = "us-east-1a"
public_ip         = "true"
vpc_tag = {
  "name" = "deploy6_vpc"
}
######### SUBNET #########
# vpc_id                  = 
cidr_block    = "10.0.1.0/24"
map_public_ip = true
subnet_tag = {
  "name" = "public_sub1a"
}

######## INSTANCE ######
ami      = ""
ec2_type = "t2.medium"

userData2 = "ud_ja_tf.sh"
userData1 = "ud_jc_.sh"
ec2_1tag  = { Name = "Jenkins Manager" }
ec2_2tag  = { Name = "Jenkins Agent" }
########### Ports ##########
ssh_access = {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

jenkins_access = {
  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

http_access = {
  from_port   = 8000
  to_port     = 8000
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

anywhereOut = {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

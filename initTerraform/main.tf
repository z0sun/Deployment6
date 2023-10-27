##### PROVIDER ###########
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}
############### VPC/SECURITY GROUPs ######################

resource "aws_security_group" "deployment6_sg" {

  ingress {
    from_port   = var.ssh_access.from_port
    to_port     = var.ssh_access.to_port
    protocol    = var.ssh_access.protocol
    cidr_blocks = var.ssh_access.cidr_blocks
  }

  ingress {
    from_port   = var.http_access.from_port
    to_port     = var.http_access.to_port
    protocol    = var.http_access.protocol
    cidr_blocks = var.http_access.cidr_blocks
  }

  ingress {
    from_port   = var.jenkins_access.from_port
    to_port     = var.jenkins_access.to_port
    protocol    = var.jenkins_access.protocol
    cidr_blocks = var.jenkins_access.cidr_blocks
  }

  egress {
    from_port   = var.anywhereOut.from_port
    to_port     = var.anywhereOut.to_port
    protocol    = var.anywhereOut.protocol
    cidr_blocks = var.anywhereOut.cidr_blocks
  }
}


######## INSTANCE ##############
resource "aws_instance" "jenkinsManager-east" {
  ami                         = var.ami
  instance_type               = var.ec2_type
  vpc_security_group_ids      = [aws_security_group.deployment6_sg.id]
  user_data                   = file("${path.module}/ud_jc_.sh")
  key_name                    = var.key_pair
  associate_public_ip_address = var.public_ip
  tags                        = var.ec2_1tag
}

resource "aws_instance" "jenkinsAgent-east" {
  ami                         = var.ami
  instance_type               = var.ec2_type
  vpc_security_group_ids      = [aws_security_group.deployment6_sg.id]
  user_data                   = file("${path.module}/ud_ja_tf.sh")
  key_name                    = var.key_pair
  associate_public_ip_address = var.public_ip
  tags                        = var.ec2_2tag
}

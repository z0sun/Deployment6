# ##### PROVIDER ######
access_key = "AKIAVBU2USROF43MJ2CI"
secret_key = "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"
region     = "us-east-1"
key_pair   = "Deployment5.1key"


######## Network #####
# df_cidr_block_anywhere  = "0.0.0.0/0"
# vpc_cidr_block          = "10.0.0.0/16"
# subnet_cidr_block_a     = "10.0.1.0/24"
# subnet_cidr_block_b     = "10.0.2.0/24"
# availability_zone_a     = "us-east-1a"
# availability_zone_b     = "us-east-1b"
public_ip = "true"
# subnet_id               = "deployment6_sg"
######## INSTANCE ######
ami      = "ami-053b0d53c279acc90"
ec2_type = "t2.medium"
# ec2_instance_tag_1      = {Name = "DP6_Jenkins_Controller"}
# ec2_instance_tag_2      = {Name = "DP6_Jenkins_Agent"}
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

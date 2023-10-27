################## D E C L A R E - V A R I A B L E ####################

################################### A W S #################################

variable "access_key" {}
variable "secret_key" {}
variable "region" {}

# ################################### V P C #################################

# variable "aws_vpc_1_name" {}
# variable "cidr_block" {}

# ################################### S U B N E T # 1 #################################

# variable "az_1" {}
# variable "aws_subnet_1_name" {}
# variable "subnet_1_cidr_block" {}


# ###################### I N T E R N E T - G A T E W A Y #################################

# variable "aws_igw_1_name" {}

# ###################### R O U T E - T A B L E #################################

# variable "aws_rt_1_name" {} 

# ################################### I N S T A N C E # 1 #################################

variable "ami" {}
variable "key_pair" {}
variable "public_ip" {}
variable "ec2_type" {}
################## Set variable for user data scripts ##########
variable "userData2" {
  description = "path to jenkins with python script"
  type        = string
  default     = "ud_ja_tf.sh"
}

variable "userData1" {
  description = "path to python script"
  type        = string
  default     = "ud_jc_.sh"
}

############ Set variables for instance tags #########
variable "ec2_1tag" {
  description = "tag for first instance"
  type        = map(string)
}

variable "ec2_2tag" {
  description = "tag for second instance"
  type        = map(string)
}
#######################################################

########################## S E C U R I T Y - G R O U P # 1 ##############################

# variable "deployment6_sg" {}
# variable "sg_1_description" {}


########## Set IAM role for instances ##########

# variable "access_level"             {default = "ec2_full_access_role"}
# variable "ver"                      {default = "2012-10-17"}
# variable "action"                   {default = "sts:AssumeRole"}
# variable "effect"                   {default = "Allow"}
# variable "principal_service"        {default = "ec2.amazonaws.com"}
# variable "policy_arn"               {default = "arn:aws:iam::aws:policy/AdministratorAccess"}
# variable "instance_profile_name"    {default = "ec2_full_access_profile"}
# variable "machine_role"             {default = "dp5_machine_role"}

################### Set variables for ingress (incoming) traffic ##############
variable "ssh_access" {
  description = "access through SSH on PORT 22"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
  default = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "http_access" {
  description = "access through http on PORT 8000"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
  default = {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "jenkins_access" {
  description = "access jenkins on PORT 8080"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
  default = {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

##################### Set variables for egress(outgoing) traffic ###############
variable "anywhereOut" {
  description = "go anywhere outbound with any protocol"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
  default = {
    from_port   = 0
    to_port     = 65000
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

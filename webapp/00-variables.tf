variable "access_key" {
  description = "AWS access key"
}

variable "secret_key" {
  description = "AWS secret access key"
}

variable "region"     {
  description = "AWS region to host your network"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.135.0.0/16"
}

variable "aws_vpc_id" {
  default = "vpc-65d81a03"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  default     = "10.135.1.0/24"
}

variable "aws_subnet_public" {
  default = "subnet-6cb33537"
  name = "interviewUser1_SN_Public"
}

variable "aws_" {}
/* amis by region */
variable "amis" {
  description = "Base AMI to launch the instances with"
  default = "ami-b73b63a0"
}
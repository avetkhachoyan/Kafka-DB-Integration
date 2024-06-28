variable "aws_region" {
  description = "AWS region"
  default = "us-west-2"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  default = "10.0.0.0/16"
}

variable "db_username" {
  description = "Database username"
}

variable "db_password" {
  description = "Database password"
  sensitive = true
}

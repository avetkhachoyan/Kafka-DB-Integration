variable "db_username" {
  description = "Database username"
}

variable "db_password" {
  description = "Database password"
  sensitive = true
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type = list(string)
}

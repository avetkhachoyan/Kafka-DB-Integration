variable "vpc_id" {
  description = "VPC ID"
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type = list(string)
}

variable "kafka_brokers_secret_arn" {
  description = "Kafka brokers secret ARN"
}

variable "rds_credentials_secret_arn" {
  description = "RDS credentials secret ARN"
}

variable "rds_endpoint" {
  description = "RDS endpoint"
}

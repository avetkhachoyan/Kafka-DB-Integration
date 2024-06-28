output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "kafka_brokers" {
  value = module.kafka.kafka_brokers
}

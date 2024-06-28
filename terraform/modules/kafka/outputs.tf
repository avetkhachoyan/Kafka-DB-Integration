output "kafka_brokers" {
  value = aws_msk_cluster.this.bootstrap_brokers_tls
}

output "kafka_brokers_secret_arn" {
  value = aws_secretsmanager_secret.kafka_brokers.arn
}

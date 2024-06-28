resource "aws_msk_cluster" "this" {
  cluster_name = "biographical-cluster"
  kafka_version = "2.8.1"
  number_of_broker_nodes = 3
  broker_node_group_info {
    instance_type = "kafka.m5.large"
    client_subnets = var.subnet_ids
    security_groups = [aws_security_group.msk.id]
  }
}

resource "aws_security_group" "msk" {
  vpc_id = var.vpc_id
  ingress {
    from_port = 9092
    to_port = 9092
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_secretsmanager_secret" "kafka_brokers" {
  name = "kafka_brokers"
  secret_string = jsonencode({
    brokers = aws_msk_cluster.this.bootstrap_brokers_tls
  })
}

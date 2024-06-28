resource "aws_instance" "consumer_instance" {
  ami = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id = element(var.subnet_ids, 0)
  security_groups = [aws_security_group.ec2.id]
  user_data = file("path/to/your/user-data-script.sh")

  tags = {
    Name = "Kafka-Consumer-Instance"
  }
}

resource "aws_security_group" "ec2" {
  vpc_id = var.vpc_id
  ingress {
    from_port = 22
    to_port = 22
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

resource "aws_secretsmanager_secret_version" "kafka_brokers" {
  secret_id = var.kafka_brokers_secret_arn
}

resource "aws_secretsmanager_secret_version" "rds_credentials" {
  secret_id = var.rds_credentials_secret_arn
}

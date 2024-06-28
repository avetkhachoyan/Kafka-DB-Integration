resource "aws_db_instance" "this" {
  allocated_storage = 20
  engine = "postgres"
  engine_version = "13.3"
  instance_class = "db.t3.micro"
  name = "biographicaldb"
  username = var.db_username
  password = var.db_password
  parameter_group_name = "default.postgres13"
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name = aws_db_subnet_group.this.name
}

resource "aws_security_group" "rds" {
  vpc_id = var.vpc_id
  ingress {
    from_port = 5432
    to_port = 5432
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

resource "aws_db_subnet_group" "this" {
  name = "rds-subnet-group"
  subnet_ids = var.subnet_ids
}

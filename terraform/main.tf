provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "rds" {
  source = "./modules/rds"
  db_username = var.db_username
  db_password = var.db_password
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
}

module "dynamodb" {
  source = "./modules/dynamodb"
}

module "kafka" {
  source = "./modules/kafka"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
  kafka_brokers_secret_arn = module.kafka.kafka_brokers_secret_arn
  rds_credentials_secret_arn = module.rds.rds_credentials_secret_arn
  rds_endpoint = module.rds.rds_endpoint
}

module "s3" {
  source = "./modules/s3"
}

module "iam" {
  source = "./modules/iam"
}

module "codepipeline" {
  source = "./modules/codepipeline"
  s3_bucket_name = module.s3.bucket_name
  codebuild_role_arn = module.iam.codebuild_role_arn
  codepipeline_role_arn = module.iam.codepipeline_role_arn
  eb_application_name = aws_elastic_beanstalk_application.web_app.name
  eb_environment_name = aws_elastic_beanstalk_environment.web_app_env.name
}

resource "aws_elastic_beanstalk_application" "web_app" {
  name = "biographical-web-app"
}

resource "aws_elastic_beanstalk_environment" "web_app_env" {
  name = "biographical-web-app-env"
  application = aws_elastic_beanstalk_application.web_app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.2.6 running Node.js 14"
}

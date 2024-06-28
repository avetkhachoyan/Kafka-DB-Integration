# Biographical Data Processing Application - Kafka-DB-Integration

This project sets up an infrastructure for a biographical data processing application using Terraform. The setup includes a webpage for data input, Kafka for data streaming, PostgreSQL and DynamoDB for data storage, and a CI/CD pipeline for continuous deployment.

## Table of Contents

- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
  - [Clone Repository](#clone-repository)
  - [Configure AWS CLI](#configure-aws-cli)
  - [Initialize Terraform](#initialize-terraform)
  - [Apply Terraform Configuration](#apply-terraform-configuration)
- [Components](#components)
  - [VPC](#vpc)
  - [RDS](#rds)
  - [DynamoDB](#dynamodb)
  - [Kafka](#kafka)
  - [EC2](#ec2)
  - [S3](#s3)
  - [IAM](#iam)
  - [CodePipeline](#codepipeline)
- [Monitoring and Logging](#monitoring-and-logging)
- [Contributing](#contributing)
- [License](#license)

## Architecture

The architecture consists of the following components:

1. **Webpage**: Users can input biographical data.
2. **Kafka**: Data from the webpage is streamed to Kafka for processing.
3. **PostgreSQL**: Processed data is saved in a relational database.
4. **DynamoDB**: Non-relational data is stored in DynamoDB.
5. **CI/CD Pipeline**: Automated deployment using AWS CodePipeline, CodeBuild, and CodeDeploy.
6. **Monitoring and Logging**: Logs and metrics are collected in AWS CloudWatch.

## Prerequisites

- [AWS CLI](https://aws.amazon.com/cli/)
- [Terraform](https://www.terraform.io/downloads.html)
- AWS account with necessary permissions

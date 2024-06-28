variable "s3_bucket_name" {
  description = "S3 bucket for codepipeline artifacts"
}

variable "codebuild_role_arn" {
  description = "IAM role ARN for CodeBuild"
}

variable "codepipeline_role_arn" {
  description = "IAM role ARN for CodePipeline"
}

variable "eb_application_name" {
  description = "Elastic Beanstalk application name"
}

variable "eb_environment_name" {
  description = "Elastic Beanstalk environment name"
}

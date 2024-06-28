resource "aws_codepipeline" "this" {
  name = "biographical-app-pipeline"

  role_arn = var.codepipeline_role_arn

  artifact_store {
    type = "S3"
    location = var.s3_bucket_name
  }

  stage {
    name = "Source"

    action {
      name = "Source"
      category = "Source"
      owner = "AWS"
      provider = "S3"
      version = "1"
      output_artifacts = ["source_output"]
      configuration = {
        S3Bucket = var.s3_bucket_name
        S3ObjectKey = "source.zip"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name = "Build"
      category = "Build"
      owner = "AWS"
      provider = "CodeBuild"
      version = "1"
      input_artifacts = ["source_output"]
      output_artifacts = ["build_output"]
      configuration = {
        ProjectName = aws_codebuild_project.this.name
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name = "Deploy"
      category = "Deploy"
      owner = "AWS"
      provider = "ElasticBeanstalk"
      version = "1"
      input_artifacts = ["build_output"]
      configuration = {
        ApplicationName = var.eb_application_name
        EnvironmentName = var.eb_environment_name
      }
    }
  }
}

resource "aws_codebuild_project" "this" {
  name = "biographical-app-build"
  service_role = var.codebuild_role_arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image = "aws/codebuild/standard:4.0"
    type = "LINUX_CONTAINER"
  }

  source {
    type = "CODEPIPELINE"
  }
}

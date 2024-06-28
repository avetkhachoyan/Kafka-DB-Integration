resource "aws_s3_bucket" "codepipeline" {
  bucket = "biographical-app-codepipeline"
  acl    = "private"

  versioning {
    enabled = true
  }
}

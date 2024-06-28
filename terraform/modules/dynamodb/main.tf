resource "aws_dynamodb_table" "this" {
  name = "BiographicalData"
  hash_key = "ID"
  attribute {
    name = "ID"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
}

provider "aws" {
  region = var.region # TODO: replace with the AWS region to deploy resources
}

resource "aws_s3_bucket" "example" {
  bucket = "REPLACE_WITH_UNIQUE_BUCKET_NAME" # TODO: replace with a globally unique S3 bucket name
}

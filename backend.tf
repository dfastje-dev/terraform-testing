terraform {
  backend "s3" {
    bucket = var.backend_bucket # TODO: replace with your S3 bucket for Terraform state
    key    = var.backend_key    # TODO: replace with path to state file
    region = var.region         # TODO: replace with AWS region where the state bucket is located
    # S3 backend uses a .tflock object alongside the state file for locking
  }
}

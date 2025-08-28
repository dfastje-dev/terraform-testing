variable "region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "backend_bucket" {
  description = "Name of the S3 bucket for Terraform state"
  type        = string
}

variable "backend_key" {
  description = "Path to the Terraform state file inside the S3 bucket"
  type        = string
}


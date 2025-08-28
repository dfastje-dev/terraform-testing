# Provider configuration and core resources for ECS Fargate

terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.9"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "random" {}
provider "time" {}

locals {
  cluster_name = "my-ecs"
  service_name = "my-service"
  tags = {
    Project = var.project
    Env     = var.env
  }
}

resource "aws_ecs_cluster" "this" {
  name = local.cluster_name
  tags = merge(local.tags, { Name = local.cluster_name })
}

resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/${local.service_name}"
  retention_in_days = 30
  tags              = merge(local.tags, { Name = "/ecs/${local.service_name}" })
}

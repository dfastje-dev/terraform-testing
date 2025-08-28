# Variables for ECS Fargate deployment

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC for deployment"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for ECS tasks"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the load balancer"
  type        = list(string)
}

variable "container_image" {
  description = "Container image for the ECS task"
  type        = string
  default     = "nginx:latest"
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
}

variable "desired_count" {
  description = "Desired number of ECS tasks"
  type        = number
  default     = 2
}

variable "min_capacity" {
  description = "Minimum number of tasks for autoscaling"
  type        = number
}

variable "max_capacity" {
  description = "Maximum number of tasks for autoscaling"
  type        = number
}

variable "task_cpu" {
  description = "CPU units for the Fargate task"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Memory for the Fargate task (in MiB)"
  type        = number
  default     = 512
}

variable "iam_task_execution_role_arn" {
  description = "ARN of the IAM task execution role"
  type        = string
}

variable "iam_task_role_arn" {
  description = "ARN of the IAM task role"
  type        = string
}

variable "iam_app_autoscaling_role_arn" {
  description = "ARN of the IAM role for application autoscaling"
  type        = string
}

variable "health_check_path" {
  description = "Path for target group health checks"
  type        = string
  default     = "/"
}

variable "project" {
  description = "Project name for tagging"
  type        = string
  default     = "my-ecs"
}

variable "env" {
  description = "Environment name for tagging"
  type        = string
  default     = "dev"
}

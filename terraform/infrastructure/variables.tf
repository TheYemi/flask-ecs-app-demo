variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-1"
}

variable "project_name" {
  description = "Name of the project, used for resource naming"
  type        = string
  default     = "flask-ecs-demo"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  description = "Availability zones to use"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b"]
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
  default     = 5000
}

variable "container_cpu" {
  description = "CPU units for the container (1024 = 1 vCPU)"
  type        = number
  default     = 256
}

variable "container_memory" {
  description = "Memory for the container in MB"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "Desired number of ECS tasks"
  type        = number
  default     = 2
}

variable "github_repository" {
  description = "GitHub repository in format owner/repo"
  type        = string
  default     = "TheYemi/flask-ecs-app-demo"
}

variable "github_branch" {
  description = "GitHub branch to track"
  type        = string
  default     = "main"
}
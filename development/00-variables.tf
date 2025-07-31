variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-southeast-1"
}

variable "aws_profile" {
  description = "The AWS profile to use for authentication"
  type        = string
}

variable "environment" {
  description = "The environment for the deployment (e.g., dev, staging, prod)"
  type        = string
}

variable "stage" {
  description = "The stage of the deployment (e.g., dev, staging, prod)"
  type        = string
}

variable "acm_domain_name" {
  description = "The domain name for the ACM certificate"
  type        = string
}

variable "acm_subject_alternative_names" {
  description = "Additional domain names for the ACM certificate"
  type        = list(string)
  default     = []
}

variable "ecr_keepImageCount" {
  description = "The validation method for the ACM certificate"
  type        = number
}

variable "ecr_mutability" {
  description = "The mutability of the ECR images (true for mutable, false for immutable)"
  type        = bool
}

variable "miziworld_http_port" {
  description = "The HTTP port for the Miziworld service"
  type        = number
}

variable "ecs_memory_size" {
  description = "The memory size for the ECS task definition"
  type        = number
}

variable "ecs_cpu_size" {
  description = "The CPU size for the ECS task definition"
  type        = number
}

variable "miziworld_app_domain" {
  description = "The domain name for the Miziworld application"
  type        = string
}

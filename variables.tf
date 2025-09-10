variable "region" {
  type        = string
  description = "AWS region"
}

variable "aws_profile" {
  type        = string
  description = "AWS CLI profile (chanchal or piyush)"
}

variable "env_name" {
  type        = string
  description = "Environment name (dev/prod)"
}

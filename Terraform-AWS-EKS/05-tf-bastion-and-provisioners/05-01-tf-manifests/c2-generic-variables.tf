variable "aws_region" {
  description = "AWS-Region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment"
  type = string
  default = "dev"
}

variable "busines_division" {
  description = "Business division in an organization"
  type = string
  default = "SAP"
}
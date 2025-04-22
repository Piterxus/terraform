variable "ami_id" {
  description = "AMI ID for Windows EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for the EC2 instances"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for Auto Scaling Group"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where the Auto Scaling Group will be created"
  type        = string
}

variable "desired_capacity" {
  description = "The number of instances the Auto Scaling group should maintain"
  default     = 1
  type        = number
}

variable "min_size" {
  description = "The minimum number of instances the Auto Scaling group can scale down to"
  default     = 1
  type        = number
}

variable "max_size" {
  description = "The maximum number of instances the Auto Scaling group can scale up to"
  default     = 3
  type        = number
}

variable "region" {
  description = "The AWS region to deploy the resources in"
  type        = string
}

variable "name" {
  description = "The name of the load balancer"
  type        = string
}

variable "security_groups" {
  description = "List of security groups to attach to the load balancer"
  type        = list(string)
}

variable "subnets" {
  description = "A list of subnets to associate with the load balancer"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Whether to enable deletion protection"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}

variable "target_group_name" {
  description = "The name of the target group"
  type        = string
}

variable "target_group_port" {
  description = "The port for the target group"
  type        = number
}

variable "target_group_protocol" {
  description = "The protocol for the target group"
  type        = string
  default     = "HTTP"
}

variable "vpc_id" {
  description = "The VPC ID to associate with the target group"
  type        = string
}

variable "target_type" {
  description = "The type of target that you must specify when registering targets with this target group"
  type        = string
  default     = "instance"
}

variable "health_check_interval" {
  description = "The approximate amount of time, in seconds, between health checks of an individual target"
  type        = number
  default     = 30
}

variable "health_check_path" {
  description = "The destination for the health check request"
  type        = string
  default     = "/"
}

variable "health_check_protocol" {
  description = "The protocol for the health check request"
  type        = string
  default     = "HTTP"
}

variable "health_check_timeout" {
  description = "The amount of time, in seconds, during which no response means a failed health check"
  type        = number
  default     = 5
}

variable "healthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
  type        = number
  default     = 2
}

variable "unhealthy_threshold" {
  description = "The number of consecutive health check failures required before considering the target unhealthy"
  type        = number
  default     = 2
}

variable "listener_port" {
  description = "The port on which the load balancer is listening"
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "The protocol for connections from clients to the load balancer"
  type        = string
  default     = "HTTP"
}

variable "vault_address" {
  description = "The address of the Vault server"
  type        = string
}

variable "vault_token" {
  description = "The Vault token for authentication"
  type        = string
}

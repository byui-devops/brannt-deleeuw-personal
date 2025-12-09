
variable "aws_region" {
  description = "AWS region to deploy to"
  type        = string
  default     = "us-west-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "docker_image_repo" {
  description = "Docker image repository (e.g. docker.io/<username>/brannt-deleeuw-personal)"
  type        = string
}

variable "docker_image_tag" {
  description = "Docker image tag to deploy"
  type        = string
  default     = "latest"
}

variable "app_port" {
  description = "Container port that the Node app listens on"
  type        = number
  default     = 8080
}

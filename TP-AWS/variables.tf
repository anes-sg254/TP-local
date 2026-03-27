variable "instance_type" {
  description = "Type de l'instance EC2"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Nom de l'instance EC2"
  type        = string
  default     = "my-ec2-instance"
}

variable "bucket_name" {
  description = "Nom du bucket S3"
  type        = string
  default     = "my-terraform-bucket"
}

variable "security_group_port" {
  description = "Port par defaut du groupe de securite"
  type        = number
  default     = 80
}
variable "region" {
  description = "The AWS region to deploy the resources."
  default     = "us-west-2"
}

variable "instance_type" {
  description = "The type of instance to deploy."
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the key pair to create and use for the instance."
  default     = "sentry-key-pair"
}

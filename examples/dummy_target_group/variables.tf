variable "region" {
  default = "us-west-2"
}

variable "environment" {
  description = "aws environment"
}

variable "profile" {
  description = "aws profile"
}

variable "aws_infra_account_ids" {
  type        = list(string)
  description = "allowed aws account ids"
  default     = []
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "vpc_id" {
  type    = string
  default = "vpc-0e32087f68f73152b"
}

variable "target_type" {
  type    = string
  default = "instance"
}
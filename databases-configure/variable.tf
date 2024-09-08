data "aws_default_vpc" "default" {
  default = true
}

#variable "vpc_id" {
#  default = data.aws_default_vpc.default.id
#}

output "vpc_id" {
  value = data.aws_default_vpc.default.id
}
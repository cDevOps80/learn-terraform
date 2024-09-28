variable "instance_type" {
  default = ["t2.micro","t3.small","t3.medium",1]
}

output "values1" {
  value = var.instance_type
}

output "values2" {
  value = toset(var.instance_type)
}

resource "aws_instance" "web" {
  for_each = toset(var.instance_type)
  ami           = "ami-0a5c3558529277641"
  instance_type = "t3.micro"

  tags = {
    Name = "test-${each.value}"
  }
}
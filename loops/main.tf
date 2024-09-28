variable "type" {
  default = {
    cart = "t2.micro"
    user = "t3.small"
  }
}
resource "aws_instance" "web" {
  for_each = var.type
  ami           = "ami-0a5c3558529277641"
  instance_type = each.value

  tags = {
    Name = "${each.key}-test"
  }
}

output "instances" {
  value = aws_instance.web.*.public_ip
}
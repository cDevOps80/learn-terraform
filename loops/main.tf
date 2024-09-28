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
  value = { for key,ips in aws_instance.web: key => ips.public_ip if length(ips.public_ip) <= 12 }
}
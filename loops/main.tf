#variable "type" {
#  default = {
#    cart = "t2.micro"
#    user = "t3.small"
#  }
#}

variable "type" {
  default = ["t2.micro","t3.small"]

}
resource "aws_instance" "web" {
  # for_each = var.type
  count = length(var.type)
  ami           = "ami-0a5c3558529277641"
  instance_type = "t3.micro"

  tags = {
    Name = "${element(var.type,count.index)}-test"
  }
}

output "instances" {
  value = { for key,ips in aws_instance.web: key => ips.public_ip }
}

output "instances-lists" {
  value = [ for ips in aws_instance.web: ips.public_ip ]
}
output "instances-list" {
  value = aws_instance.web.*.public_ip
}
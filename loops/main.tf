resource "aws_instance" "web" {
  count =        length(var.instances)
  ami           = "ami-0a5c3558529277641"
  instance_type = "t2.micro"

  tags = {
    Name = "test-${count.index}"
  }
}

variable "instances" {
  default = [2,1]
}

output "final" {
  value = aws_instance.web
}
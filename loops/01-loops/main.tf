variable "instance_type" {
  default = ["t2.micro","t3.small","t3.medium"]
}

resource "aws_instance" "web" {
  for_each = var.instance_type
  ami           = "ami-0a5c3558529277641"
  instance_type = "t3.micro"

  tags = {
    Name = "test"
  }
}
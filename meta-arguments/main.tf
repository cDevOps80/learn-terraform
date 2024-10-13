resource "aws_instance" "sample" {
  ami           = "ami-00f251754ac5da7f0"
  instance_type = "t2.medium"

  tags = {
    Name = "web-1"
  }
}
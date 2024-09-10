/*
resource "aws_instance" "web" {
  ami           = "ami-0a5c3558529277641"
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.web-sg]
}
variable "web-sg" {}
output "web-path" {
  value = path.module
}
*/


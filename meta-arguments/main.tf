/*
resource "aws_instance" "sample" {
  ami           = "ami-00f251754ac5da7f0"
  instance_type = "t2.medium"
  availability_zone = "us-east-1a"

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      instance_type,
      tags
    ]
  }
  tags = {
    Name = "web-1"

  }
}
*/

resource "null_resource" "one" {
  provisioner "local-exec" {
    command = "bash ${path.module}/run.sh"
  }
}






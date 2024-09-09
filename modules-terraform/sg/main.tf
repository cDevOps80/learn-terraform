/*
resource "aws_security_group" "web-sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.default.id


dynamic "ingress" {
  for_each = var.ports
  content {
    from_port        = ingress.value.port
    to_port          = ingress.value.port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description = "${ingress.key}-allowing"
  }
}

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

variable "ports" {
  default = {
    ssh = {
      port = 22
    }
     mysql = {
      port = 3306
    }
  }
}
*/
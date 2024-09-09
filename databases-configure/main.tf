
#resource "aws_instance" "databases" {
#  ami           = "ami-0a5c3558529277641"
#  instance_type = "t3.micro"
#  vpc_security_group_ids = [aws_security_group.db-sg.id]
#  user_data = templatefile("./user.sh",{
#    MYSQL_ROOT_PASSWORD   = "RoboShop@1"
#    RABBITMQ_DEFAULT_USER = "roboshop"
#    RABBITMQ_DEFAULT_PASS = "roboshop123"
#  })
#  key_name = "nvirginia"
#
#  instance_market_options {
#    market_type = "spot"
#    spot_options {
#      instance_interruption_behavior = "stop"
#      spot_instance_type = "persistent"
#    }
#  }
#
#  tags = {
#    Name = "roboshop-db"
#  }
#}

variable "ports" {
  default = {
    ssh = {
      port = 22
      cidr_blocks = ["0.0.0.0/0"]
    }
    mysql = {
      port = 3306
      cidr_blocks = ["0.0.0.0/0"]
    }
    redis = {
      port = 6379
      cidr_blocks = ["0.0.0.0/0"]
    }
    mongod = {
      port = 27017
      cidr_blocks = ["0.0.0.0/0"]
    }
    rabbitmq = {
      port = 5672
      cidr_blocks = ["0.0.0.0/0"]
    }
    rabbitmq1 = {
      port = 5671
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_security_group" "db-sg" {
  name        = "allow_databases"
  description = "Allow TLS inbound traffic "
  vpc_id      = data.aws_vpc.default.id

#  ingress {
#    from_port        = 22
#    to_port          = 22
#    protocol         = "tcp"
#    cidr_blocks      = ["0.0.0.0/0"]
#  }

  dynamic "ingress" {
    for_each = var.ports
    iterator = ports
    content {
      from_port        = ports.value.port
      to_port          = ports.value.port
      description      = "${ports.key}-allowing"
      protocol         = "tcp"
      cidr_blocks      = ["sg-0665a56c7cd09a0e0"]
    }
  }

#  ingress {
#    from_port        = 3306
#    to_port          = 3306
#    protocol         = "tcp"
#    cidr_blocks      = ["0.0.0.0/0"]
#
#  }
#
#  ingress {
#    from_port        = 27017
#    to_port          = 27017
#    protocol         = "tcp"
#    cidr_blocks      = ["0.0.0.0/0"]
#
#  }
#  ingress {
#    from_port        = 6379
#    to_port          = 6379
#    protocol         = "tcp"
#    cidr_blocks      = ["0.0.0.0/0"]
#
#  }

#  ingress {
#    from_port        = 5672
#    to_port          = 5672
#    protocol         = "tcp"
#    cidr_blocks      = ["0.0.0.0/0"]
#  }
#
#  ingress {
#    from_port        = 5671
#    to_port          = 5671
#    protocol         = "tcp"
#    cidr_blocks      = ["0.0.0.0/0"]
#  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshopdb-sg"
  }
}

/*
output "content" {
  value = templatefile("./user.sh",{
    MYSQL_ROOT_PASSWORD   = "RoboShop@1"
    RABBITMQ_DEFAULT_USER = "roboshop"
    RABBITMQ_DEFAULT_PASS = "roboshop123"
  })
}

*/
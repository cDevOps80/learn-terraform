provider "aws" {
  region = "us-east-1"
}


provider "aws" {
  alias = "apsouth"
  region = "ap-south-1"
}

resource "aws_instance" "us-east" {
  ami           = "ami-0a5c3558529277641"
  instance_type = "t2.micro"
}

resource "aws_instance" "ap-south" {
  provider      = aws.apsouth
  ami           = "ami-0888ba30fd446b771"
  instance_type = "t2.micro"
}
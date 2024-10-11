variable "loop1" {
  default = ["one","two","three",4]
}

resource "aws_instance" "sample" {
 # count         =  length(var.loop1)
  for_each       = var.loop1
  ami           = "ami-00f251754ac5da7f0"
  instance_type = "t2.micro"

  tags = {
   Name = "web-${element(var.loop1,count.index)}"

  }
}
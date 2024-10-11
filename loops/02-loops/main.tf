variable "loop1" {
  default = ["one","two"]
}

resource "aws_instance" "sample" {
 # count         =  length(var.loop1)cd
  for_each       = toset(var.loop1)
  ami           = "ami-00f251754ac5da7f0"
  instance_type = "t2.micro"

  tags = {
   Name = "web-${each.value}"
  }
}

output "one" {
  value = [ for i in aws_instance.sample : i.id ]
}
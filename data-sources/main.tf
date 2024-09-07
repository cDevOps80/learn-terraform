# Fetching DevOps-Practice AMI-Id Information.

data "aws_ami_ids" "ami" {

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["Amazon Linux 2.*"]
  }

}

output "ami_list" {
  value = data.aws_ami_ids.ami
}
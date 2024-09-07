# Fetching DevOps-Practice AMI-Id Information.

data "aws_ami_ids" "ami" {

  owners = [973714476881]
  name_regex = "^*DevOps-Practice"

  filter {
    name   = "block-device-mapping.volume-type"
    values = ["gp3"]
  }
}

output "ami_list" {
  value = data.aws_ami_ids.ami
}
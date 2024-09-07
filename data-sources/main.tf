# Fetching DevOps-Practice AMI-Id Information.

#data "aws_ami_ids" "ami" {
#
#  owners = [973714476881]
#  name_regex = "^*DevOps-Practice"
#
#  filter {
#    name   = "block-device-mapping.volume-type"
#    values = ["gp3"]
#  }
#}
#
#output "ami_list" {
#  value = data.aws_ami_ids.ami
#}

#data "aws_instances" "foo" {
#
#  instance_state_names = ["stopped"]
#
#  instance_tags = {
#    Name = "main"
#  }
#
#
#
#}
#
#output "aws_instances" {
#  value = data.aws_instances.foo
#}

data "external" "example" {
  working_dir = "/home/centos"
  program = ["bash","name"]
}

output "final" {
  value = data.external.example.query["key1"]
}
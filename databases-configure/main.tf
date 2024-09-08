resource "aws_instance" "databases" {
  ami           = "ami-0a5c3558529277641"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0665a56c7cd09a0e0"]
  user_data = file("./user.sh")
  key_name = "nvirginia"

  instance_market_options {
    market_type = "spot"
    spot_options {
      instance_interruption_behavior = "stop"
      spot_instance_type = "persistent"
    }
  }

  tags = {
    Name = "databases-1"
  }

}
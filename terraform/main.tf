resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.medium"

  tags = {
    Name        = "skyxops-web-dev"
    Environment = "dev"
    Team        = "platform"
  }
}

resource "aws_ebs_volume" "web_data" {
  availability_zone = "us-east-1a"
  size              = 20
  type              = "gp3"

  tags = {
    Name = "skyxops-web-data"
  }
}

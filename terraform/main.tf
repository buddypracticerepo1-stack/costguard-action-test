resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.large"

  tags = {
    Name        = "web-prod"
    Environment = "production"
    Team        = "platform"
  }
}

resource "aws_ebs_volume" "web_data" {
  availability_zone = "us-east-1a"
  size              = 100
  type              = "gp3"

  tags = {
    Name = "web-data-prod"
  }
}

resource "aws_db_instance" "main" {
  allocated_storage    = 100
  engine               = "postgres"
  engine_version       = "15.4"
  instance_class       = "db.r6g.xlarge"
  db_name              = "appdb"
  skip_final_snapshot  = true
  storage_encrypted    = true
  multi_az             = true

  tags = {
    Name        = "app-db-prod"
    Environment = "production"
  }
}

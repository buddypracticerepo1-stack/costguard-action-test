resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.xlarge"

  tags = {
    Name        = "costguard-web-prod"
    Environment = "production"
    Team        = "platform"
  }
}

resource "aws_ebs_volume" "web_data" {
  availability_zone = "us-east-1a"
  size              = 200
  type              = "gp3"
  iops              = 6000
  throughput        = 250

  tags = {
    Name = "costguard-web-data-prod"
  }
}

resource "aws_db_instance" "primary" {
  identifier          = "costguard-db-prod"
  engine              = "postgres"
  engine_version      = "15.4"
  instance_class      = "db.r6g.large"
  allocated_storage   = 100
  multi_az            = true
  storage_encrypted   = true
  skip_final_snapshot = true

  tags = {
    Name        = "costguard-db-prod"
    Environment = "production"
  }
}

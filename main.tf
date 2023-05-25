provider "aws" {
  region = "us-east-1"
}


#Dev
resource "aws_instance" "dev" {
  ami           = var.amis.us-east-1
  instance_type = var.instance_type.free
  key_name      = var.key_name
  tags = {
    Name = "dev"
  }
  vpc_security_group_ids = [aws_security_group.ssh_access.id]
  depends_on             = [aws_s3_bucket.dev_s3_bucket]
}

resource "aws_s3_bucket" "dev_s3_bucket" {
  bucket = "fireslan-s3-dev"

  tags = {
    Name = "s3-dev"
  }
}

#Homolog
resource "aws_instance" "homolog" {
  ami           = var.amis.us-east-1
  instance_type = var.instance_type.free
  key_name      = var.key_name
  tags = {
    Name = "homolog"
  }
  vpc_security_group_ids = [aws_security_group.ssh_access.id]
  depends_on             = [aws_s3_bucket.homolog_s3_bucket]
}

resource "aws_s3_bucket" "homolog_s3_bucket" {
  bucket = "fireslan-s3-homolog"

  tags = {
    Name = "s3-homolog"
  }
}


#PROD
resource "aws_instance" "prod" {
  ami           = var.amis.us-east-1
  instance_type = var.instance_type.free
  key_name      = var.key_name
  tags = {
    Name = "prod"
  }
  vpc_security_group_ids = [aws_security_group.ssh_access.id]
  depends_on             = [aws_s3_bucket.prod_s3_bucket]
}

resource "aws_s3_bucket" "prod_s3_bucket" {
  bucket = "fireslan-s3-prod"

  tags = {
    Name = "s3-prod"
  }
}

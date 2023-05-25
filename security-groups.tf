resource "aws_security_group" "ssh_access" {
  name        = "ssh_access"
  description = "Security Group to provide external SSH Access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_addresses
  }

  tags = {
    Name = "ssh"
  }
}

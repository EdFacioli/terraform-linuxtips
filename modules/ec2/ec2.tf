resource "aws_instance" "this" {
  ami             = "ami-0ccabb5f82d4c9af5"
  instance_type   = var.instance_type
  key_name        = aws_key_pair.this.key_name
  security_groups = [aws_security_group.this.name]

  tags = {
    "Name" = "HelloWord"
  }
}

resource "aws_key_pair" "this" {
  key_name   = "facioli.dev.br-terraform"
  public_key = file(var.file_path_key_pair)
}

resource "aws_security_group" "this" {
  name        = "sg_allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  tags = {
    "Name" = "ssh connection"
  }
}

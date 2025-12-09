
locals {
  name = "brannt-deleeuw-personal-ec2"
}

# Security group allowing HTTP 80 from anywhere
resource "aws_security_group" "web" {
  name        = "${local.name}-sg"
  description = "Allow HTTP"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Latest Amazon Linux 2 AMI
data "aws_ami" "al2" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Render user-data with repo, tag, and app_port
data "template_file" "userdata" {
  template = file("${path.module}/user_data.sh")
  vars = {
    docker_image_repo = var.docker_image_repo
    docker_image_tag  = var.docker_image_tag
    app_port          = var.app_port
  }
}

resource "aws_instance" "app" {
  ami                    = data.aws_ami.al2.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web.id]

  user_data = data.template_file.userdata.rendered

  tags = {
    Name = local.name
  }
}

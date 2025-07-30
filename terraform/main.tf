provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "k8s_monitoring_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [var.security_group_id]

  # User data to bootstrap the EC2 with necessary tools
  user_data = file("user-data.sh")

  tags = {
    Name = "k8s-monitoring-server"
  }
}

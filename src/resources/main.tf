provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "instance_example" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  security_groups = [aws_security_group.sg_instance_example.name]

  tags = {
    Name        = "ec2-instance-${var.env}-example"
    environment = var.env
    project     = var.project
    team        = var.team
  }
}
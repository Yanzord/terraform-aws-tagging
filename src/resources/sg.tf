resource "aws_security_group" "sg_instance_example" {
    name = "sg_instance_example"
    vpc_id = element(tolist(data.aws_vpcs.main_vpc.ids), 0)

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "sg-instance-example"
        env = var.env
        project = var.project
        team = var.team
    }
}
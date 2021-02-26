resource "aws_security_group" "bastion_sg" {
    name = "BastionSG"
    description = "Allow ssh"
    vpc_id = var.vpc_id

    ingress {
        from_port = "22"
        to_port = "22"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "bastion_sg"
        Terraform = true
    }
}

resource "aws_security_group" "application_sg" {
    name = "ApplicationSG"
    vpc_id = var.vpc_id

    ingress {
        from_port = "22"
        to_port = "22"
        protocol = "TCP"
        security_groups = [aws_security_group.bastion_sg.id]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "application_sg"
        Terraform = true
    }
}

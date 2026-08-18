resource "aws_security_grouo" "mysg" {
name = "TERRAFORM_SG"
description = "This is Created by terraform"
vpc_id = aws_vpc.myvpc.id
ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_block = ["0.0.0.0/0"]
}
ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_block = ["0.0.0.0/0"]
}

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_block = ["0.0.0.0/0"]
}
}

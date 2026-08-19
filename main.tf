resources "aws_launch_template" "mylt" {
name = "Terraform_Template"
description = "This is cretaed by Terraform"
image_id = ami-0dfe08bb9a5a11ed2
instance_type = "t3.micro"
key_name = "my-KP"
vpc_security_group_ids = [aws_security_group.mysg.id]
placement {
availability_zone = "ap-southeast-2a"
}
}

resource "aws_elb" "myelb" {
name = "Terraform_LB"
subnets = [aws_subnet.subnet1.id , aws_subnet.subnet2.id]
security_groups = [aws_security_group.mysg.id]
listener {
instance_port = 80
instance_protocol = "http"
lb_port = 80
lb_protocol = "http"
}
tags {
  Name = "Terraform_lb"
  Env = "dev"
}
}

resource "aws_autoscalling_group" "myasg" {
name = "Terraform_ASG"
launch_template {
  id = aws_launch_template.mylt.id
}
desired_capacity = 4
min_size = 2
max_size = 8
vpc_identifier = [aws_subnet.subnet1.id , aws_subnet.subnet2.id]
load_balancer = [aws_elb.myelb.name]
}


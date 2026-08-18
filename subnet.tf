resource "aws_subnet" "mysubnet" {
  vpc_id = aws_vpc.myvpc.id

  availability_zone       = "us-east-2a"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Terraform-subnet"
  }
}


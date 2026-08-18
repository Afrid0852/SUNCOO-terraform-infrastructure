resource "aws_route_table_association" "rt_ass" {
  subnet_id      = aws_subnet.mysubnet.id
  route_table_id = aws_route_table.myrt.id

}

# Create  Route Table. This block creates a route table, associates it with the VPC, and creates a default route to the Internet Gateway.... where rtb = "route-table"
resource "aws_route_table" "Altschoolproject_route_table" {
  vpc_id                = aws_vpc.Altschoolproject_vpc.id

  route {
    cidr_block          = "0.0.0.0/0"
    gateway_id          = aws_internet_gateway.Altschoolproject_internet_gateway.id
  }

  tags = {
    Name        = "Altschoolproject_route_table"
  }
}

# Create Route Table Association. This block associates the subnets with the route table.... where rtb = "route-table-association"
resource "aws_route_table_association" "Altschoolproject_route_table1" {
  subnet_id             = aws_subnet.Altschoolproject_subnet1.id
  route_table_id        = aws_route_table.Altschoolproject_route_table.id
}

resource "aws_route_table_association" "Altschoolproject_route_table2" {
  subnet_id             = aws_subnet.Altschoolproject_subnet2.id
  route_table_id        = aws_route_table.Altschoolproject_route_table.id
}

resource "aws_route_table_association" "Altschoolproject_route_table3" {
  subnet_id             = aws_subnet.Altschoolproject_subnet3.id
  route_table_id        = aws_route_table.Altschoolproject_route_table.id
}
# Create Internet Gateway. This block creates an Internet Gateway and attaches it to the VPC.
resource "aws_internet_gateway" "Altschoolproject_internet_gateway" {
  vpc_id                = aws_vpc.Altschoolproject_vpc.id

  tags = {
    Name                = "Altschoolproject_internet_gateway"
  }
}
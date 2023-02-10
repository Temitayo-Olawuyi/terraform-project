# Create  subnet. This block specifies the subnet details such as the CIDR block, the VPC ID, and the availability zone.
resource "aws_subnet" "Altschoolproject_subnet1" {
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.Altschoolproject_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"

  tags = {
    Name                = "Altschoolproject_subnet1"
  }
}

resource "aws_subnet" "Altschoolproject_subnet2" {
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.Altschoolproject_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"

  tags = {
    Name                = "Altschoolproject_subnet2"
  }
}

resource "aws_subnet" "Altschoolproject_subnet3" {
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.Altschoolproject_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1c"

  tags = {
    Name                = "Altschoolproject_subnet3"
  }
}
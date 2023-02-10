# Creating a resource block for  VPC. This block is  specifying the VPC details such as CIDR block, the number of availability zones, etc.
resource "aws_vpc" "Altschoolproject_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "Altschoolproject_vpc"
  }
}
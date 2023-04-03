resource "aws_vpc" "vpc" {
  id = data.aws_vpc.vpc.id
}

resource "aws_route_table" "rt_nat" {
  vpc_id = data.aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = data.aws_nat_gateway.nat.id
  }
}

# Creating Private subnet 
resource "aws_subnet" "pvt_sub" {
  vpc_id                  = data.aws_vpc.vpc.id
  cidr_block             = "10.0.100.0/24"
  availability_zone = "ap-south-1"
}

# Creating Route table for Private Subnet
resource "aws_route_table" "rt_private" {
    vpc_id                  = data.aws_vpc.vpc.id
}

resource "aws_route_table_association" "rt_associate_private" {
    subnet_id = aws_subnet.pvt_sub.id
    route_table_id = aws_route_table.rt_private.id
}


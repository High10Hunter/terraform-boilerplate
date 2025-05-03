resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_block)

  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.public_subnet_cidr_block, count.index)

  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "${local.base_name}-public-subnet-${count.index}"
  }
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_block)

  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.private_subnet_cidr_block, count.index)

  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "${local.base_name}-private-subnet-${count.index}"
  }
}

resource "aws_subnet" "database" {
  count = length(var.database_subnet_cidr_block)

  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.database_subnet_cidr_block, count.index)

  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "${local.base_name}-database-subnet-${count.index}"
  }
}

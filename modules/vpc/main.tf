resource "aws_vpc" "this" {
    cidr_block           = var.cidr_block
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags = {
        Name = var.name
    }
}

# public subnets
resource "aws_subnet" "public" {
    count             = 2
    vpc_id            = aws_vpc.this.id
    cidr_block        = element(var.public_subnet_cidrs, count.index)
    availability_zone = element(var.azs, count.index)

    tags = {
        Name = "${var.name}-public-${count.index + 1}"
    }
}

resource "aws_subnet" "private" {
    count             = 2
    vpc_id            = aws_vpc.this.id
    cidr_block        = element(var.private_subnet_cidrs, count.index)
    availability_zone = element(var.azs, count.index)

    tags = {
        Name = "${var.name}-private-${count.index + 1}"
    }
}


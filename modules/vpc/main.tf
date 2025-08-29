resource "aws_vpc" "this" {
    cidr_block           = var.cidr_block
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags = {
        Name = var.name
    }
}

# internet gateway
resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.this.id

    tags = {
        Name = "${var.name}-internet-gateway"
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

# private subnets
resource "aws_subnet" "private" {
    count             = 2
    vpc_id            = aws_vpc.this.id
    cidr_block        = element(var.private_subnet_cidrs, count.index)
    availability_zone = element(var.azs, count.index)

    tags = {
        Name = "${var.name}-private-${count.index + 1}"
    }
}

# public route tables
resource "aws_route_table" "public" {
    count   = 2
    vpc_id = aws_vpc.this.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }
    tags = {
        Name = "${var.name}-public-route-table-${count.index + 1}"
    }
}

# associate public route table to public subnets
resource "aws_route_table_association" "public" {
    count          = 2
    subnet_id      = aws_subnet.public[count.index].id
    route_table_id = aws_route_table.public[count.index].id
}

# private route tables
resource "aws_route_table" "private" {
    count   = 2
    vpc_id = aws_vpc.this.id

    tags = {
        Name = "${var.name}-private-route-table-${count.index + 1}"
    }
}

# associate private route table to private subnets
resource "aws_route_table_association" "private" {
    count          = 2
    subnet_id      = aws_subnet.private[count.index].id
    route_table_id = aws_route_table.private[count.index].id
}
resource "aws_route_table" "public-rt-1" {
    vpc_id = aws_vpc.main.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main-igw.id
    }
    tags = {
        Name = "public-route_table-1" 
        Terraform = true
    }
}
resource "aws_route_table_association" "public-rt-1_assoc_pb_subnet-1" {
    route_table_id = aws_route_table.public-rt-1.id
    subnet_id = aws_subnet.z1-public-1.id
}
resource "aws_route_table_association" "public-rt-1_assoc_pb_subnet-2" {
    route_table_id = aws_route_table.public-rt-1.id
    subnet_id = aws_subnet.z2-public-1.id
}
resource "aws_route_table_association" "public-rt-1_assoc_pb_subnet-3" {
    route_table_id = aws_route_table.public-rt-1.id
    subnet_id = aws_subnet.z3-public-1.id
}

resource "aws_route_table" "private-rt-1" {
    vpc_id = aws_vpc.main.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.z1_nat.id
    }
    
    tags = {
        Name = "private-route_table-1" 
        Terraform = true
    }
}
resource "aws_route_table_association" "private-rt-1_assoc_pr_subnet-1" {
    route_table_id = aws_route_table.private-rt-1.id
    subnet_id = aws_subnet.z1-private-1.id
}

resource "aws_route_table" "private-rt-2" {
    vpc_id = aws_vpc.main.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.z2_nat.id
    }

    tags = {
        Name = "private-route_table-2" 
        Terraform = true
    }
}
resource "aws_route_table_association" "private-rt-2_assoc_pr_subnet-1" {
    route_table_id = aws_route_table.private-rt-2.id
    subnet_id = aws_subnet.z2-private-1.id
}

resource "aws_route_table" "private-rt-3" {
    vpc_id = aws_vpc.main.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.z3_nat.id
    }

    tags = {
        Name = "private-route_table-3" 
        Terraform = true
    }
}
resource "aws_route_table_association" "private-rt-3_assoc_pr_subnet-1" {
    route_table_id = aws_route_table.private-rt-3.id
    subnet_id = aws_subnet.z3-private-1.id
}

resource "aws_vpc" "main" {
    cidr_block = var.base_cidr_block

    tags = {
        Name = "main-vpc"
        Terraform = true
    }
}

resource "aws_internet_gateway" "main-igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "main-internet_gateway"
        Terraform = true
    }
}

resource "aws_eip" "eip_z1_nat" {
    vpc = true
}
resource "aws_nat_gateway" "z1_nat" {
    allocation_id = aws_eip.eip_z1_nat.id
    subnet_id = aws_subnet.z1-public-1.id

    tags = {
        Name = "z1_nat"
        Terraform = true
    }
}

resource "aws_eip" "eip_z2_nat" {
    vpc = true
}
resource "aws_nat_gateway" "z2_nat"{
    allocation_id = aws_eip.eip_z2_nat.id
    subnet_id = aws_subnet.z2-public-1.id
    
    tags = {
        Name = "z2_nat"
        Terraform = true
    }
}

resource "aws_eip" "eip_z3_nat" {
    vpc = true
}
resource "aws_nat_gateway" "z3_nat"{
    allocation_id = aws_eip.eip_z3_nat.id
    subnet_id = aws_subnet.z3-public-1.id
    
    tags = {
        Name = "z3_nat"
        Terraform = true
    }
}

resource "aws_subnet" "z1-public-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = cidrsubnet(var.base_cidr_block, 8, 1)
    availability_zone = var.availability_zones[0]
    map_public_ip_on_launch = true

    tags = {
        Name = "z1-public-1-subnet"
        Terraform = true
    }
}
resource "aws_subnet" "z1-private-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = cidrsubnet(var.base_cidr_block, 8, 2)
    availability_zone = var.availability_zones[0]
    tags = {
        Name = "z1-private-1-subnet"
        Terraform = true
    }
}
resource "aws_subnet" "z1-private-2" {
    vpc_id = aws_vpc.main.id
    cidr_block = cidrsubnet(var.base_cidr_block, 8, 3)
    availability_zone = var.availability_zones[0]
    tags = {
        Name = "z1-private-2-subnet"
        Terraform = true
    }
}

resource "aws_subnet" "z2-public-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = cidrsubnet(var.base_cidr_block, 8, 4)
    availability_zone = var.availability_zones[1]
    map_public_ip_on_launch = true

    tags = {
        Name = "z2-public-1-subnet"
        Terraform = true
    }
}
resource "aws_subnet" "z2-private-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = cidrsubnet(var.base_cidr_block, 8, 5)
    availability_zone = var.availability_zones[1]
    tags = {
        Name = "z2-private-1-subnet"
        Terraform = true
    }
}
resource "aws_subnet" "z2-private-2" {
    vpc_id = aws_vpc.main.id
    cidr_block = cidrsubnet(var.base_cidr_block, 8, 6)
    availability_zone = var.availability_zones[1]
    tags = {
        Name = "z2-private-2-subnet"
        Terraform = true
    }
}

resource "aws_subnet" "z3-public-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = cidrsubnet(var.base_cidr_block, 8, 7)
    availability_zone = var.availability_zones[2]
    map_public_ip_on_launch = true
        
    tags = {
        Name = "z3-public-1-subnet"
        Terraform = true
    }
}
resource "aws_subnet" "z3-private-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = cidrsubnet(var.base_cidr_block, 8, 8)
    availability_zone = var.availability_zones[2]
    tags = {
        Name = "z3-private-1-subnet"
        Terraform = true
    }
}
resource "aws_subnet" "z3-private-2" {
    vpc_id = aws_vpc.main.id
    cidr_block = cidrsubnet(var.base_cidr_block, 8, 9)
    availability_zone = var.availability_zones[2]
    tags = {
        Name = "z3-private-2-subnet"
        Terraform = true
    }
}


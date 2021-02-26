output "vpc_id" {
    value = aws_vpc.main.id
}

output "public_subnet_z1" {
    value = aws_subnet.z1-public-1
}

output "public_subnet_z2" {
    value = aws_subnet.z2-public-1
}

output "public_subnet_z3" {
    value = aws_subnet.z3-public-1
}

output "private_subnet_app_z1" {
    value = aws.aws_subnet.z1-private-1
}

output "private_subnet_app_z2" {
    value = aws.aws_subnet.z2-private-1
}

output "private_subnet_app_z3" {
    value = aws.aws_subnet.z3-private-1
}

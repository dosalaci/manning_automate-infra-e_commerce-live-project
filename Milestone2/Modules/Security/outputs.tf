output "bastion_sg" {
    value = aws_security_group.bastion_sg.id
}

output "application_sg" {
    value = aws_security_group.application_sg.id
}

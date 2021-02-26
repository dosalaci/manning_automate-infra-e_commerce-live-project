variable "namespace" {
    type = string
    description = "namespace of the infrastructure"
}

variable "base_cidr_block" {
    type = string
}

variable "region" {
    type = string
}

variable "availability_zones" {
    type = list(string)
}

variable "environment" {
    type = string
}

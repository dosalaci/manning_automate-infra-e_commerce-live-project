variable "namespace" {
    type = string
}

variable "base_cidr_block" {
    type = string
}

variable "availability_zones" {
    type = list(string)
}
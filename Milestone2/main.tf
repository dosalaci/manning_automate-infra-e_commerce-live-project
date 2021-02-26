module "networking" {
    source = "./modules/networking"
    namespace = var.namespace
    base_cidr_block = var.base_cidr_block
    availability_zones = var.availability_zones
}

module "security" {
    source = "./modules/security"
    vpc_id = module.networking.vpc_id
}

module "application" {
    source = "./modules/application"
    public_subnet_z1 = module.network.public_subnet_z1
    private_subnet_z1_app = module.network.private_subnet_z1_app
    private_subnet_z2_app = module.network.private_subnet_z2_app
    private_subnet_z3_app = module.network.private_subnet_z3_app
    bastion_sg = module.security.bastion_sg
    application_sg = module.security.application_sg
}

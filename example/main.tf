
terraform {
    required_version = ">= 0.12.18"
}

provider "aws" {
    region  = var.aws_region
    profile = var.aws_profile
    version = ">= 2.28.1"
}

module "iam_roles" {
    source  = "../"
    tags    = var.tags
    roles   = var.roles
}
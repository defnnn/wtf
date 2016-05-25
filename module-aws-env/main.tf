provider "aws" {
  region = "${var.provider_region}"
}

module "vpc" {
  source = "../module-aws-vpc"

  provider_region = "${var.provider_region}"

  vpc_name = "${var.vpc_name}"
  vpc_cidr = "${var.vpc_cidr}"
}

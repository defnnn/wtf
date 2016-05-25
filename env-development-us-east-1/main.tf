provider "aws" {
  region = "${var.provider_region}"
}

module "env" {
  source = "../module-aws-env"

  provider_region = "${var.provider_region}"

  vpc_name = "${var.vpc_name}"
  vpc_cidr = "${var.vpc_cidr}"
}

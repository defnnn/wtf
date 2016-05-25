provider "aws" {
  region = "${var.provider_region}"
}

resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"

  tags {
    "Name" = "${var.vpc_name}"
    "Vpc" = "${var.vpc_name}"
    "Provisioner" = "tf"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    "Name" = "${var.vpc_name}"
    "Vpc" = "${var.vpc_name}"
    "Provisioner" = "tf"
  }
}

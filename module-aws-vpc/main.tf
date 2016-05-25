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

resource "aws_subnet" "nat" {
  vpc_id = "${aws_vpc.vpc.id}"

  count = "${var.az_count}"
  availability_zone = "${element(split(" ",var.az_names), count.index)}"

	cidr_block = "${element(split(" ", var.nat_cidrs), count.index)}"

  lifecycle {
    create_before_destroy = false
  }

  tags {
    "Name" = "nat-${element(split(" ", var.az_names), count.index)}"
    "Provisioner" = "tf"
  }
}

resource "aws_eip" "nat" {
  vpc = true

  count = "${var.az_count}"
}

resource "aws_nat_gateway" "nat" {
  count = "${var.az_count}"

  subnet_id = "${element(aws_subnet.nat.*.id, count.index)}"
  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
}

provider "aws" {
  region = "${var.provider_region}"
}

resource "aws_subnet" "nat" {
  vpc_id = "${var.vpc_id}"

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

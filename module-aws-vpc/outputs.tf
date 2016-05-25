output "vpc_name" {
  value = "${var.vpc_name}"
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_cidr" {
  value = "${aws_vpc.vpc.cidr}"
}

output "igw_id" {
  value = "${aws_internet_gateway.igw.id}"
}

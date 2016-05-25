output "nat_public_ips" {
  value = "${join(" ", aws_eip.nat.*.public_ip)}"
}

output "nat_subnets" {
  value = "${join(" ", aws_subnet.nat.*.id)}"
}

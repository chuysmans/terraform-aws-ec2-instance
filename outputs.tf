output "public_dns" {
  value = "${aws_instance.ubuntu.public_dns}"
}

output "arn" {
  value = "${aws_instance.ubuntu.arn}"
}

output "public_ip" {
  value = "${aws_instance.ubuntu.public_ip}"
}

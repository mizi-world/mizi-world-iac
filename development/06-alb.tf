resource "aws_alb" "application_load_balancer" {
  name                       = "${var.environment}-load-balancer"
  load_balancer_type         = "application"
  enable_deletion_protection = true
  subnets = [
    "${aws_default_subnet.subnet_public_1a.id}",
    "${aws_default_subnet.subnet_public_1b.id}"
  ]
  security_groups = ["${aws_security_group.alb.id}"]
}

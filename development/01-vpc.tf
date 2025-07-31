resource "aws_default_vpc" "vpc" {
  tags = {
    Name = "${var.environment} VPC"
  }
}

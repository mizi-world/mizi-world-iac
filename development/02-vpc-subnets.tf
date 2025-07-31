resource "aws_default_subnet" "subnet_public_1a" {
  availability_zone = "${var.aws_region}a"
}

resource "aws_default_subnet" "subnet_public_1b" {
  availability_zone = "${var.aws_region}b"
}

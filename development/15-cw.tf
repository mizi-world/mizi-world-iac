resource "aws_cloudwatch_log_group" "cw_log" {
  name = "${var.environment}-log-cw"

  tags = {
    Environment = var.stage
  }
}

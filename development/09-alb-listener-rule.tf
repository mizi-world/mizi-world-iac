resource "aws_lb_listener_rule" "service_https_listener" {
  listener_arn = aws_lb_listener.https.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }

  condition {
    host_header {
      values = [var.miziworld_app_domain]
    }
  }
}

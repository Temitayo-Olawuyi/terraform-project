# create listener for the load balancer.

resource "aws_lb_listener" "Altschoolproject_listener" {
  load_balancer_arn  = aws_lb.Altschoolproject_lb.arn
  port               = 80
  protocol           = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Altschoolproject_tg.arn
  }
}

# create listener rule for the load balancer.

resource "aws_lb_listener_rule" "Altschoolproject_listener_rule" {
  listener_arn       = aws_lb_listener.Altschoolproject_listener.arn
  priority           = 1
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Altschoolproject_tg.arn
  }
  condition {
  path_pattern {
      values         = ["/"]
    }
  }
}
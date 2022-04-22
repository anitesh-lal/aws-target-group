resource "aws_lb_target_group" "this" {
  name                               = var.name
  name_prefix                        = var.name_prefix
  port                               = var.port
  protocol                           = upper(var.protocol)
  proxy_protocol_v2                  = var.proxy_protocol_v2
  target_type                        = var.target_type
  vpc_id                             = var.vpc_id
  connection_termination             = var.connection_termination
  deregistration_delay               = var.deregistration_delay
  lambda_multi_value_headers_enabled = var.lambda_multi_value_headers_enabled
  load_balancing_algorithm_type      = var.load_balancing_algorithm_type
  preserve_client_ip                 = var.preserve_client_ip
  protocol_version                   = var.protocol_version
  slow_start                         = var.slow_start

  health_check {
    enabled             = var.health_check_enabled
    healthy_threshold   = var.healthy_threshold
    interval            = var.health_check_interval
    matcher             = var.health_check_matcher
    path                = var.health_check_path
    port                = var.health_check_port
    protocol            = upper(var.health_check_protocol)
    timeout             = var.health_check_timeout
    unhealthy_threshold = var.unhealthy_threshold
  }

  stickiness {
    enabled         = var.stickiness_enabled
    cookie_duration = var.stickiness_cookie_duration
    cookie_name     = var.stickiness_cookie_name
    type            = var.stickiness_type
  }

  tags = var.tags
}
module "tg" {
  source = "../../"

  name            = "tf-example-lb-tg"
  port            = 443
  protocol        = "tcp"
  target_type     = var.target_type
  vpc_id          = var.vpc_id
  stickiness_type = "lb_cookie"
  tags            = var.tags
}

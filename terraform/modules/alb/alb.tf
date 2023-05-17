module "alb" {
  source          = "../../resources/elb/elb"
  internal        = false
  name            = "${var.tags.service}-${var.tags.env}-alb"
  security_groups = var.security_groups
  subnets         = var.subnets
  tags            = var.tags
  access_logs = [
    {
      bucket  = module.alb_logs.s3_bucket.id
      enabled = true
      prefix  = "alb/${var.tags.service}-${var.tags.env}-alb"
    }
  ]
}

module "blue_target_group" {
  source                = "../../resources/elb/target_group"
  health_check_interval = 60
  health_check_matcher  = "200"
  health_check_path     = "/"
  health_check_port     = 3000
  health_check_timeout  = 10
  name                  = "${var.tags.service}-${var.tags.env}-blue-target-group"
  port                  = 3000
  protocol              = "HTTP"
  tags                  = var.tags
  target_type           = "ip"
  vpc_id                = var.vpc_id
}

module "blue_listener" {
  source          = "../../resources/elb/listener"
  certificate_arn = module.acm.acm_certificate.arn
  default_action = [
    {
      target_group_arn = module.blue_target_group.elb_target_group.arn
      type             = "forward"
    }
  ]
  load_balancer_arn = module.alb.elb.arn
  name              = "${var.tags.service}-${var.tags.env}-blue-listener"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-FS-1-2-Res-2020-10"
  tags              = var.tags
}

module "green_target_group" {
  source                = "../../resources/elb/target_group"
  health_check_interval = 60
  health_check_matcher  = "200"
  health_check_path     = "/"
  health_check_port     = 3000
  health_check_timeout  = 10
  name                  = "${var.tags.service}-${var.tags.env}-green-target-group"
  port                  = 3000
  protocol              = "HTTP"
  tags                  = var.tags
  target_type           = "ip"
  vpc_id                = var.vpc_id
}

module "green_listener" {
  source          = "../../resources/elb/listener"
  certificate_arn = module.acm.acm_certificate.arn
  default_action = [
    {
      target_group_arn = module.green_target_group.elb_target_group.arn
      type             = "forward"
    }
  ]
  load_balancer_arn = module.alb.elb.arn
  name              = "${var.tags.service}-${var.tags.env}-blue-listener"
  port              = "8080"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-FS-1-2-Res-2020-10"
  tags              = var.tags
}

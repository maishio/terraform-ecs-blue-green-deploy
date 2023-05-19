module "wafv2" {
  source      = "../../resources/wafv2/web_acl"
  description = "Web ACL for ALB"
  name        = "${var.tags.service}-${var.tags.env}-alb-waf"
  scope       = "REGIONAL"
  tags        = var.tags

  rule = [
    {
      name     = "AWSManagedRulesCommonRuleSet"
      priority = 10
      action   = []
      override_action = [
        {
          type = "none"
        }
      ]
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesCommonRuleSet"
          vendor_name = "AWS"
        }
      ]
      not_statement = []
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesCommonRuleSetMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name     = "AWSManagedRulesKnownBadInputsRuleSet"
      priority = 20
      action   = []
      override_action = [
        {
          type = "none"
        }
      ]
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesKnownBadInputsRuleSet"
          vendor_name = "AWS"
        }
      ]
      not_statement = []
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesKnownBadInputsRuleSetMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name     = "AWSManagedRulesAmazonIpReputationList"
      priority = 30
      action   = []
      override_action = [
        {
          type = "none"
        }
      ]
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesAmazonIpReputationList"
          vendor_name = "AWS"
        }
      ]
      not_statement = []
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesAmazonIpReputationListMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name     = "AWSManagedRulesAnonymousIpList"
      priority = 40
      action   = []
      override_action = [
        {
          type = "none"
        }
      ]
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesAnonymousIpList"
          vendor_name = "AWS"
        }
      ]
      not_statement = []
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesAnonymousIpListMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name     = "AWSManagedRulesSQLiRuleSet"
      priority = 50
      action   = []
      override_action = [
        {
          type = "none"
        }
      ]
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesSQLiRuleSet"
          vendor_name = "AWS"
        }
      ]
      not_statement = []
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesSQLiRuleSetMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name     = "AWSManagedRulesLinuxRuleSet"
      priority = 60
      action   = []
      override_action = [
        {
          type = "none"
        }
      ]
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesLinuxRuleSet"
          vendor_name = "AWS"
        }
      ]
      not_statement = []
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesLinuxRuleSetMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name     = "AWSManagedRulesUnixRuleSet"
      priority = 70
      action   = []
      override_action = [
        {
          type = "none"
        }
      ]
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesUnixRuleSet"
          vendor_name = "AWS"
        }
      ]
      not_statement = []
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesUnixRuleSetMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name     = "BlockOverseasIPsRule"
      priority = 1
      action = [
        {
          type = "block"
        }
      ]
      override_action              = []
      managed_rule_group_statement = []
      not_statement = [
        {
          geo_match_statement = [
            {
              country_codes = ["JP"]
            }
          ]
        }
      ]
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "BlockOverseasIPsRuleMetric"
          sampled_requests_enabled   = false
        }
      ]
    }
  ]

  cloudwatch_metrics_enabled = true
  metric_name                = "${var.tags.service}-${var.tags.env}-alb-waf"
  sampled_requests_enabled   = false
}

module "wafv2_association" {
  source       = "../../resources/wafv2/web_acl_association"
  resource_arn = module.alb.elb.arn
  web_acl_arn  = module.wafv2.wafv2_web_acl.arn
}

module "wafv2_logging" {
  source                  = "../../resources/wafv2/web_acl_logging_configuration"
  log_destination_configs = [module.wafv2_logs.s3_bucket.arn]
  resource_arn            = module.wafv2.wafv2_web_acl.arn
}

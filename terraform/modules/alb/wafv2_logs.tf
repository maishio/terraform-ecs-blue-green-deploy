module "wafv2_logs" {
  source        = "../../resources/s3/bucket"
  bucket        = "${var.tags.service}-${var.tags.env}-wafv2-logs-${var.account.id}"
  force_destroy = var.tags.env == "prod" ? false : true
  tags          = var.tags
}

module "wafv2_logs_lifecycle" {
  source = "../../resources/s3/bucket_lifecycle_configuration"
  bucket = module.alb_logs.s3_bucket.id
  rule = [
    {
      id     = "wafv2"
      status = "Enabled"
      transition = [
        {
          days          = 30
          storage_class = "GLACIER"
        }
      ],
      expiration = [
        {
          days = 365
        }
      ]
    }
  ]
}

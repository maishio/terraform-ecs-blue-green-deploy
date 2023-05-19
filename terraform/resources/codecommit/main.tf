# AWS CodeCommit
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codecommit_repository

resource "aws_codecommit_repository" "this" {
  repository_name = var.repository_name
  description     = var.description
  default_branch  = var.default_branch
  tags            = merge(var.tags, { "Name" = var.repository_name })
}

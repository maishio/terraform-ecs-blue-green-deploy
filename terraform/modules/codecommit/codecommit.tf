module "codecommit" {
  source          = "../../resources/codecommit"
  description     = "ECS task definition for Blue/Green deployment."
  repository_name = "${var.tags.service}-${var.tags.env}-blue-green-deploy"
  tags            = var.tags
}

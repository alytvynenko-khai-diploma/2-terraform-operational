locals {
  diploma_list = [
    "1-gcp-initialization",
    "2-terraform-operational",
    "microservices-demo",
  ]
}

resource "gitlab_project" "devops-only" {
  for_each = toset(local.diploma_list)

  name                = each.value
  description         = "[TF MANAGED]"
  avatar              = "${path.module}/repo-avatars/${each.value}.png"
  namespace_id        = gitlab_group.devops-only.id
  auto_devops_enabled = false

  visibility_level = "public"
}

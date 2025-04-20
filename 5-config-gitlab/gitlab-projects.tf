locals {
  diploma_list = [
    "1-gcp-initialization",
    "2-terraform-operational",
    "microservices-demo",
  ]

  no_avatars = [
    "K8S-connection",
  ]
}

# Repos with set avatars
resource "gitlab_project" "general" {
  for_each = toset(local.diploma_list)

  name                = each.value
  description         = "[TF MANAGED]"
  avatar              = "${path.module}/repo-avatars/${each.value}.png"
  namespace_id        = gitlab_group.general.id
  auto_devops_enabled = false

  visibility_level = "public"
}

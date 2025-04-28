resource "kubernetes_secret" "gitlab_initial_root_password" {
  metadata {
    name      = "test-gitlab-initial-root-password"
    namespace = var.namespace
  }

  data = {
    password = "cBF6mXjB0qoAdRXSuyIho6KcyCjxQu" # FIXME: set password using dynamic variables
  }

  type = "Opaque"
}

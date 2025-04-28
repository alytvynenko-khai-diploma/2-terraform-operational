# FIXME: default role shouldn't have the admin permissions
# should be fixed in security topic later
resource "kubernetes_cluster_role_binding" "gitlab_agent_cluster_role_binding" {
  metadata {
    name = "gitlab-agent-cluster-role-binding"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "infrastructure"
  }

  role_ref {
    kind     = "ClusterRole"
    name     = "cluster-admin"
    api_group = "rbac.authorization.k8s.io"
  }
}

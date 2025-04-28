locals {
  project_id_for_cluster_agent = gitlab_project.general[local.diploma_list[2]].id
}

resource "gitlab_cluster_agent" "this" {
  # project = data.gitlab_project.this.id
  project = local.project_id_for_cluster_agent
  name    = "cicd-deployment"
}

resource "gitlab_cluster_agent_token" "this" {
  project     = local.project_id_for_cluster_agent
  agent_id    = gitlab_cluster_agent.this.agent_id
  name        = "my-agent-token"
  description = "Token for the my-agent used with `gitlab-agent` Helm Chart"
}

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
    kind      = "ClusterRole"
    name      = "cluster-admin"
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "helm_release" "gitlab_agent" {
  name       = "gitlab-agent"
  namespace  = var.namespace
  repository = "https://charts.gitlab.io"
  chart      = "gitlab-agent"
  version    = "1.22.0"
  values     = [file("${path.module}/cluster-agent-values.yaml")]

  set {
    name  = "config.token"
    value = gitlab_cluster_agent_token.this.token
  }

  set {
    name  = "image.tag"
    value = "v17.11.0"
  }

  set {
    name  = "config.kasAddress"
    value = "ws://kas.ci.alytvynenko.net"
  }

  set {
    name  = "serviceserviceAccount.name"
    value = "gitlab-agent"
  }
}

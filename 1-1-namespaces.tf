locals {
  list_of_namespaces = [
    "infrastructure",
    "application",
    "app-and-infra"
  ]
}

resource "kubernetes_namespace" "this" {
  for_each = toset(local.list_of_namespaces)

  metadata {
    annotations = {
      name = each.value
    }
    name = each.value
  }
}

resource "local_file" "config-context-creation" {
  filename = "TO-EXECUTE/1-config-contexts.ps1"

  # content = join("\n", [
  content = <<EOT
# 1. Create config contexts
%{ for idx, namespace in local.list_of_namespaces }
kubectl config set-context "${idx}-${namespace}" --cluster=docker-desktop --user=docker-desktop --namespace=${namespace}
%{ endfor }
# 2. Use created contexts
%{ for idx, namespace in local.list_of_namespaces }
kubectl config use-context "${idx}-${namespace}"
%{ endfor }
EOT
  # ])
}

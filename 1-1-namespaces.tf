resource "kubernetes_namespace" "infrastructure" {
  metadata {
    annotations = {
      name = "infrastructure"
    }
    name = "infrastructure"
  }
}

resource "kubernetes_namespace" "application" {
  metadata {
    annotations = {
      name = "application"
    }
    name = "application"
  }
}

resource "kubernetes_namespace" "app-and-infra" {
  metadata {
    annotations = {
      name = "app-and-infra"
    }
    name = "app-and-infra"
  }
}

resource "local_file" "config-context-creation" {
  filename = "TO-EXECUTE/1-config-contexts.ps1"

  content = join("\n", [
    # Creation commands
    "kubectl config set-context \"1-infrastructure\" --cluster=docker-desktop --user=docker-desktop --namespace=infrastructure",
    "kubectl config set-context \"2-application\" --cluster=docker-desktop --user=docker-desktop --namespace=application",


    # Usage commands
    "\n", # New line
    "kubectl config use-context \"1-infrastructure\"",
    "kubectl config use-context \"2-application\"",
  ])
}

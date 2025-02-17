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


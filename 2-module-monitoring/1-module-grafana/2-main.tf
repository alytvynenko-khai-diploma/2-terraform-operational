resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = "infrastructure"
  version    = "8.10.0"

  # values = split("\n", file("${path.module}/grafana-values.yaml")) # TODO: use templatefile()

  # set {
  #   name  = "service.type"
  #   # value = "LoadBalancer" # Change to ClusterIP or NodePort if needed
  #   value = "NodePort" # Change to ClusterIP or NodePort if needed
  # }

  # set {
  #   name  = "ingress.enabled"
  #   value = "true"
  # }

  # set {
  #   name  = "ingress.hosts[0]"
  #   value = "grafana.example.com"
  # }
}

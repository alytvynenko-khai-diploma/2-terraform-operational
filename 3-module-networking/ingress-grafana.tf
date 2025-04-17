resource "kubernetes_ingress_v1" "grafana" {

  metadata {
    name      = "grafana"
    namespace = var.namespace
  }

  spec {
    ingress_class_name = "gitlab-nginx"
    rule {
      host = "grafana.ci.alytvynenko.net"
      http {
        path {
          path = "/"
          backend {
            service {
              name = "kube-prometheus-stack-grafana"
              port {
                # name = "http"
                number = 80
              }
            }
          }
        }
      }
    }
  }
}

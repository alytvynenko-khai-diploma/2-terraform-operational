resource "kubernetes_ingress_v1" "grafana" {

  metadata {
    name = "grafana"
    namespace = var.namespace
  }

  spec {
    ingress_class_name = "haproxy"
    rule {
      host = "grafana.ci.alytvynenko.net"
      http {
        path {
          path = "/"
          backend {
            service {
              name = "grafana"
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

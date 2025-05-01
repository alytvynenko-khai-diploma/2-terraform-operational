# APPLICATION
resource "kubernetes_ingress_v1" "application" {
  metadata {
    name      = "frontend-application-haproxy"
    namespace = "application"
  }

  spec {
    ingress_class_name = "haproxy"
    rule {
      host = "app.${local.dns_basename}"
      http {
        path {
          path = "/"
          backend {
            service {
              name = "frontend"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}

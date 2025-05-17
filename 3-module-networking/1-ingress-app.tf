# APPLICATION
resource "kubernetes_ingress_v1" "application" {
  metadata {
    name      = "frontend-application-haproxy"
    namespace = "application"
    # FIXME: disable cert-manager for now for test environment
    # annotations = {
    #   "cert-manager.io/issuer" = "letsencrypt-staging"
    # }
  }

  spec {
    ingress_class_name = "haproxy"
    # FIXME: disable cert-manager for now for test environment
    # tls {
    #   hosts = [ "app.${local.dns_basename}" ]
    #   secret_name = "frontend-cert"
    # }

    # TODO: replace by cert-manager
    # tls {
    #   secret_name = "haproxy-cert"
    #   hosts      = [ "app.${local.dns_basename}" ]
    # }
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

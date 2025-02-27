resource "kubernetes_ingress_v1" "influxdb" {

  metadata {
    name      = "influxdb"
    namespace = var.namespace
  }

  spec {
    ingress_class_name = "gitlab-nginx"
    rule {
      host = "influxdb.ci.alytvynenko.net"
      http {
        path {
          path = "/"
          backend {
            service {
              name = "influxdb-influxdb2"
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

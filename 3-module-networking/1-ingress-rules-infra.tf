locals {
  dns_basename = "ci.alytvynenko.net"

  single_port_ingress_rules = [
    {
      rule_name = "grafana",
      full_dns  = "grafana.${local.dns_basename}",
      svc_name  = "kube-prometheus-stack-grafana",
      svc_port  = 80,
    },
    # FIXME: influxdb is disabled, remove or leave
    {
      rule_name = "influxdb",
      full_dns  = "influxdb.${local.dns_basename}",
      svc_name  = "influxdb-influxdb2",
      svc_port  = 80,
    },
    # GITLAB Services
    {
      rule_name = "gitlab-webservice-default",
      full_dns  = "gitlab.${local.dns_basename}",
      svc_name  = "gitlab-webservice-default",
      svc_port  = 8181,
    },
    {
      rule_name = "gitlab-minio",
      full_dns  = "minio.${local.dns_basename}",
      svc_name  = "gitlab-minio",
      svc_port  = 9000,
    },
    {
      rule_name = "gitlab-registry",
      full_dns  = "registry.${local.dns_basename}",
      svc_name  = "gitlab-registry",
      svc_port  = 5000,
    },
  ]
}

resource "kubernetes_ingress_v1" "single_port_ingress_rules" {
  for_each = { for rule in local.single_port_ingress_rules : rule.rule_name => rule }

  metadata {
    name      = "${each.value.rule_name}-haproxy"
    namespace = var.namespace
  }

  spec {
    ingress_class_name = "haproxy"
    rule {
      host = each.value.full_dns
      http {
        path {
          path = "/"
          backend {
            service {
              name = each.value.svc_name
              port {
                number = each.value.svc_port
              }
            }
          }
        }
      }
    }
  }
}

# GITLAB KAS
resource "kubernetes_ingress_v1" "gitlab-kas" {
  metadata {
    name      = "gitlab-kas-haproxy"
    namespace = var.namespace
  }

  spec {
    ingress_class_name = "haproxy"
    rule {
      host = "kas.${local.dns_basename}"
      http {
        path {
          path = "/"
          backend {
            service {
              name = "gitlab-kas"
              port { number = 8150 }
            }
          }
        }
        path {
          path = "/k8s-proxy/"
          backend {
            service {
              name = "gitlab-kas"
              port { number = 8154 }
            }
          }
        }
      }
    }
  }
}

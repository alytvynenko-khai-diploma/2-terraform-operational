locals {
  domains = [
    # Monitoring
    "grafana", "influxdb",

    # GitLab services
    "kas", "gitlab", "minio", "registry",

    # Application
    "app"
  ]
}

resource "namecheap_domain_records" "this" {
  domain     = "alytvynenko.net"
  email_type = "NONE"

  dynamic "record" {
    for_each = toset(local.domains)
    content {
      hostname = "${record.value}.ci"
      type     = "A"
      address  = var.load_balancer_ip
    }
  }
}
# resource "tls_private_key" "haproxy" {
#   algorithm = "RSA"
#   rsa_bits  = 2048
# }

# resource "tls_self_signed_cert" "haproxy" {
#   private_key_pem = tls_private_key.haproxy.private_key_pem

#   subject {
#     common_name  = "alytvynenko.net"
#     organization = "Andrii Lytvynenko"
#   }

#   validity_period_hours = 4400 # 1/2 year
#   is_ca_certificate = false

#   allowed_uses = [
#     "key_encipherment",
#     "digital_signature",
#     "server_auth",
#   ]

#   dns_names = [
#     "grafana.ci.alytvynenko.net",
#     "influxdb.ci.alytvynenko.net",
#     "gitlab.ci.alytvynenko.net",
#     "kas.ci.alytvynenko.net",
#     "minio.ci.alytvynenko.net",
#     "registry.ci.alytvynenko.net",
#     "gitlab.ci.alytvynenko.net",
#     "app.ci.alytvynenko.net",
#   ]
# }

# resource "kubernetes_secret" "haproxy-tls" {
#   metadata {
#     name      = "haproxy-cert"
#     namespace = "app-and-infra"
#   }

#   data = {
#     "tls.key" = tls_private_key.haproxy.private_key_pem
#     "tls.crt" = tls_self_signed_cert.haproxy.cert_pem
#   }

#   type = "kubernetes.io/tls"
# }

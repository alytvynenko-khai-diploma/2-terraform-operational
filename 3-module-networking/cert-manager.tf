# resource "helm_release" "cert-manager" {
#   name       = "jetstack"
#   repository = "https://charts.jetstack.io"
#   chart      = "cert-manager"
#   namespace  = "app-and-infra"
#   version    = "1.17.2"

#   set {
#     name = "crds.enabled"
#     value = true
#   }
# }


# resource "kubernetes_manifest" "letsencrypt_staging_clusterissuer" {
#   depends_on = [ helm_release.cert-manager ]

#   manifest = {
#     apiVersion = "cert-manager.io/v1"
#     # kind       = "ClusterIssuer"
#     kind       = "Issuer"
#     metadata = {
#       name = "letsencrypt-staging"
#       namespace = "app-and-infra"
#     }
#     spec = {
#       acme = {
#         email  = "bopongamer@gmail.com"
#         server = "https://acme-staging-v02.api.letsencrypt.org/directory"
#         privateKeySecretRef = {
#           name = "haproxy-cert"
#         }
#         solvers = [
#           {
#             http01 = {
#               ingress = {
#                 ingressClassName = "haproxy"
#               }
#             }
#           }
#         ]
#       }
#     }
#   }
# }

# # resource "kubernetes_manifest" "tls_certificate" {
# #   manifest = {
# #     apiVersion = "cert-manager.io/v1"
# #     kind       = "Certificate"
# #     metadata = {
# #       name      = "haproxy-cert"
# #       namespace = "app-and-infra"
# #     }
# #     spec = {
# #       secretName = "haproxy-cert"
# #       issuerRef = {
# #         name = "letsencrypt-staging"
# #         kind = "ClusterIssuer"
# #       }
# #       commonName = "alytvynenko.net"
# #       dnsNames = [
# #         "www.alytvynenko.net",
# #         "alytvynenko.net",
# #         "ci.alytvynenko.net",
# #         "grafana.ci.alytvynenko.net",
# #         "grafana.ci.alytvynenko.net",
# #         "influxdb.ci.alytvynenko.net",
# #         "gitlab.ci.alytvynenko.net",
# #         "kas.ci.alytvynenko.net",
# #         "minio.ci.alytvynenko.net",
# #         "registry.ci.alytvynenko.net",
# #         "gitlab.ci.alytvynenko.net",
# #         "app.ci.alytvynenko.net",
# #       ]
# #     }
# #   }
# # }

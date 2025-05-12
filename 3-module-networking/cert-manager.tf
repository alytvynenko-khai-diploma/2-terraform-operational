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

# resource "kubernetes_manifest" "letsencrypt_staging_issuer" {
#   depends_on = [ helm_release.cert-manager ]

#   manifest = {
#     apiVersion = "cert-manager.io/v1"
#     kind       = "Issuer"
#     metadata = {
#       name = "letsencrypt-staging"
#       namespace = "app-and-infra"
#     }
#     spec = {
#       acme = {
#         server  = "https://acme-staging-v02.api.letsencrypt.org/directory"
#         email   = "bopongamer@gmail.com"
#         privateKeySecretRef = {
#           name = "letsencrypt-staging"
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

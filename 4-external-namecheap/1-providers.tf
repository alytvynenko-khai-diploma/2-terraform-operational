terraform {
  required_providers {
    namecheap = {
      source = "namecheap/namecheap"
      version = ">= 2.0.0"
    }
  }
}
provider "namecheap" {
  user_name = var.secret_namecheap_api_user
  api_user = var.secret_namecheap_api_user
  api_key = var.secret_namecheap_api_key
  client_ip = var.secret_namecheap_client_ip

  use_sandbox = false
}

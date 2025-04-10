terraform {
  required_providers {
    namecheap = {
      source = "namecheap/namecheap"
      version = ">= 2.0.0"
    }
  }
}
provider "namecheap" {
  user_name = "" # FIXME: this secret should be secured
  api_user = "" # FIXME: this secret should be secured
  api_key = "" # FIXME: this secret should be secured
  client_ip = "" # FIXME: this secret should be secured
  use_sandbox = false
}

terraform {
  required_providers {
    authentik = {
      source = "goauthentik/authentik"
      version = "2024.6.1"
    }
  }
}


provider "authentik" {
  token = var.authentik_token
  url   = var.authentik_url
}
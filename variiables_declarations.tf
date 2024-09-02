variable "grafana_users" {
  type = list(object({
    name = string
    role = string
    org = list(string)
    email = string
    password = string
  }))
}

variable "grafana_client_secret" { type = string }

variable "grafana_client_id" { type = string }

variable "grafana_application_name" { type = string }

variable "grafana_oidc_provider_name" { type = string }

variable "grafana_redirect_uris" { type = list(string) }

variable "grafana_scope_name" { type = string }

variable "authentik_token" { type = string }

variable "authentik_url" { type = string }
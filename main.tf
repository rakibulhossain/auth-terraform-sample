data "authentik_flow" "default-authorization-flow" {
  slug = "default-provider-authorization-implicit-consent"
}

data "authentik_flow" "default-authentication-flow" {
  slug = "default-authentication-flow"
}

data "authentik_scope_mapping" "scope-email" {
  name = "authentik default OAuth Mapping: OpenID 'email'"
}

data "authentik_scope_mapping" "scope-profile" {
  name = "authentik default OAuth Mapping: OpenID 'profile'"
}

data "authentik_scope_mapping" "scope-openid" {
  name = "authentik default OAuth Mapping: OpenID 'openid'"
}

resource "authentik_scope_mapping" "grafana-scope" {
  expression = <<EOF
return {
    "grafana_org": request.user.attributes.get("grafana_org", ""),
    "grafana_role": request.user.attributes.get("grafana_role", "")
}
EOF
  name = format("authentik custom OAuth Mapping: OpenID '%s'", var.grafana_scope_name)
  scope_name = var.grafana_scope_name
}

resource "authentik_provider_oauth2" "test" {
  client_id = var.grafana_client_id
  client_secret = var.grafana_client_secret

  authentication_flow = data.authentik_flow.default-authentication-flow.id
  authorization_flow = data.authentik_flow.default-authorization-flow.id

  name = var.grafana_oidc_provider_name

  redirect_uris = var.grafana_redirect_uris

  property_mappings = [
    data.authentik_scope_mapping.scope-email.id,
    data.authentik_scope_mapping.scope-profile.id,
    data.authentik_scope_mapping.scope-openid.id,
    authentik_scope_mapping.grafana-scope.id,
  ]
}

resource "authentik_application" "grafana-test" {
  name              = var.grafana_application_name
  slug              = var.grafana_application_name
  protocol_provider = authentik_provider_oauth2.test.id
}
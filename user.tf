resource "authentik_user" "users" {
  for_each = {
    for idx, obj in tolist(var.grafana_users):
        obj.name => obj
  }
  username = each.value.name
  email = each.value.email
  name = each.value.name
  password = each.value.password
  attributes = jsonencode({
    "grafana_org": each.value.org,
    "grafana_role": each.value.role,
  })
}
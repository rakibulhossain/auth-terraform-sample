grafana_users = [
  {
    name = "rakib"
    role = "None"
    org = ["first_org", "second_org"]
    email = "rakibgtr2@gmail.com"
    password = "1234"
  },
  {
    name = "nishat",
    role = "None"
    org = ["first_org"]
    email = "nishat@pathao.com"
    password = "1234"
  }
]

grafana_client_secret = "lastsecretjagshaskhksdgkjdkudgskddgkjfkjsdgkjasdjfgsjkhs"
grafana_client_id = "lastclientidhasghjasfjhafshjf"

grafana_application_name = "grafana-test"

grafana_oidc_provider_name = "grafana-test"

grafana_redirect_uris = ["http://localhost:3000/login/generic_oauth"]

grafana_scope_name = "grafana"

authentik_token = "rezXR897DkZtBCrhlGhsp0NkgTtvFCihqC1OUBUY343uF83iV7flJwkdDJv2"

authentik_url = "https://4bca-27-147-144-153.ngrok-free.app/"
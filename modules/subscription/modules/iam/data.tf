data "http" "autoconnect_agentless_scanner_delete_role" {
  url = "https://${var.khulnasoft_bucket_name}.s3.amazonaws.com/autoconnect_agentless_scanner_delete_role.json"
}
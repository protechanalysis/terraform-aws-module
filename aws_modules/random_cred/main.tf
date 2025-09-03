resource "random_string" "random_cred" {
  length  = var.length
  special = var.special
  numeric = var.numeric
  override_special = "!%$&"
}

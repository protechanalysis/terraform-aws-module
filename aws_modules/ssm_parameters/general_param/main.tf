resource "aws_ssm_parameter" "cloud_parameters" {
  for_each    = var.parameters
  name        = each.key
  description = each.value["description"]
  type        = each.value["type"]
  value       = each.value["value"]
  tags        = var.tags
  
}
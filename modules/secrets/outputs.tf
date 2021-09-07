output "arn" {
  value = local.arns
}

output "map" {
  value = local.secretMap
}

output "kms_key_arn" {
  value = aws_kms_key.encryption_key.arn
}

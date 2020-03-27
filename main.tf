resource "aws_efs_file_system" "default" {
  count                           = var.enabled ? 1 : 0
  tags                            = var.tags
  encrypted                       = var.encrypted
  kms_key_id                      = var.kms_key_id
  performance_mode                = var.performance_mode
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps
  throughput_mode                 = var.throughput_mode
}

resource "aws_efs_mount_target" "default" {
  for_each        = { for i in var.subnets : i => i if var.enabled }
  file_system_id  = join("", aws_efs_file_system.default.*.id)
  ip_address      = var.mount_target_ip_address
  subnet_id       = each.key
  security_groups = var.security_group_ids
}

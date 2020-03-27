output "arn" {
  value       = join("", aws_efs_file_system.default.*.arn)
  description = "EFS ARN"
}

output "id" {
  value       = join("", aws_efs_file_system.default.*.id)
  description = "EFS ID"
}

output "dns_name" {
  value       = "${join("", aws_efs_file_system.default.*.id)}.efs.${var.region}.amazonaws.com"
  description = "EFS DNS name"
}

output "mount_target_dns_names" {
  value       = [for mt in aws_efs_mount_target.default : mt.dns_name]
  description = "List of EFS mount target DNS names"
}

output "mount_target_ids" {
  value       = [for mt in aws_efs_mount_target.default : mt.id]
  description = "List of EFS mount target IDs (one per Availability Zone)"
}

output "mount_target_ips" {
  value       = [for mt in aws_efs_mount_target.default : mt.ip_address]
  description = "List of EFS mount target IPs (one per Availability Zone)"
}

output "network_interface_ids" {
  value       = [for mt in aws_efs_mount_target.default : mt.network_interface_id]
  description = "List of mount target network interface IDs"
}

output "public_ip" {
  description = "Your ipv4 public ip"
  value       = coalesce(local.ifconfig_me, local.see_ip, local.big_data_cloud)
}

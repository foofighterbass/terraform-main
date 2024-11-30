output "ipv4" {
  value = module.base_vms.public_ipv4
  sensitive = true
}
output "public_ipv4" {
  description = "Instance Public IPv4 Address"
  value       = values(proxmox_virtual_environment_vm.k8s_workers)
}


/* output "public_ipv4" {
  description = "Instance Public IPv4 Address"
  value = values(proxmox_virtual_environment_vm.k8s_workers)
}


output "random_nubmer"  {
    description = "value"
    value = var.config
} */



/* output "public_ipv4" {
  description = "Instance Public IPv4 Address"
  value       = flatten(proxmox_virtual_environment_vm.k8s_workers.ipv4_addresses[1])
} */

/* output "public_ipv4" {
  description = "Instance Public IPv4 Address"
  value = values(lookup(proxmox_virtual_environment_vm.k8s_workers , "[initialization]"))
} */

output "public_ipv4" {
  description = "Instance Public IPv4 Address"
  value       = values(proxmox_virtual_environment_vm.k8s_workers).*.ipv4_addresses
}

/* output "show_vm" {
  value = data.proxmox_virtual_environment_hosts.test_vm
} */


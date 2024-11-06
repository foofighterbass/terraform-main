terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.66.3"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_endpoint
  username = var.proxmox_username
  password = var.proxmox_password
  insecure = true
}

module "base_vm" {
  source                   = "./modules/create_clean_ubuntu_vm"
  vm_node_name             = var.vm_node_name
  vm_datastore_id          = var.vm_datastore_id
  vm_dns_server_1          = var.vm_dns_server_1
  vm_dns_server_2          = var.vm_dns_server_2
  vm_ipv4_gateway          = var.vm_ipv4_gateway
  vm_ipv4_adress           = var.vm_ipv4_adress
  vm_cpu_cores             = var.vm_cpu_cores
  vm_cpu_sockets           = var.vm_cpu_sockets
  vm_memory_amount         = var.vm_memory_amount
  vm_network_device_bridge = var.vm_network_device_bridge
  vm_network_device_model  = var.vm_network_device_model
  vm_disk_iso_file_id      = var.vm_disk_iso_file_id
  vm_disk_size             = var.vm_disk_size
  #vm_names = ["k3s-master", "k3s-worker1", "k3s-worker2"]
  # ... другие параметры
}

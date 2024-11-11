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

module "k3s_cluster" {
  source                   = "../../../modules/services/k3s_cluster"
  proxmox_endpoint         = "https://192.168.0.4:8006/"
  proxmox_username         = "root@pam"
  proxmox_password         = "proxmoxpass"
  vm_ipv4_adress           = "192.168.0.98/24"
  vm_ipv4_gateway          = "192.168.0.1"
  vm_node_name             = "bn-1"
  vm_datastore_id          = "local-lvm"
  vm_dns_server_1          = "192.168.0.1"
  vm_dns_server_2          = "1.1.1.1"
  vm_cpu_cores             = 1
  vm_cpu_sockets           = 1
  vm_memory_amount         = 1024
  vm_network_device_bridge = "vmbr0"
  vm_network_device_model  = "virtio"
  vm_disk_iso_file_id      = "local:iso/ubuntu_cloud_image_22_04_lts.img"
  vm_disk_size             = 20
  vm_user                  = "kim"
  vm_password              = "$6$kW4vfBM9kGgq4hr$TFtHW7.3jOECR9UCBuw9NrdSMJETzSVoNQGcVv2y.RqRUzWDEtYhYRkGvIpB6ml1fh/fZEVIgKbSXI9L1B6xF."
}

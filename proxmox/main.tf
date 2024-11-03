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

module "cloud_vm" {
  source  = "./modules/cloud_vm"
  #vm_names = ["k3s-master", "k3s-worker1", "k3s-worker2"]
  # ... другие параметры
}

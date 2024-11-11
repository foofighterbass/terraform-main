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
  source           = "../../../modules/services/k3s_cluster"
  proxmox_endpoint = "https://192.168.0.4:8006/"
  proxmox_username = "root@pam"
  proxmox_password = "proxmoxpass"
  vm_user          = "kim"
  vm_password      = "$6$kW4vfBM9kGgq4hr$TFtHW7.3jOECR9UCBuw9NrdSMJETzSVoNQGcVv2y.RqRUzWDEtYhYRkGvIpB6ml1fh/fZEVIgKbSXI9L1B6xF."

}

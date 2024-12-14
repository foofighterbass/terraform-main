terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.66.3"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_path
  username = var.proxmox_user
  password = var.proxmox_pass
  insecure = true
}

module "base_vms" {
  source   = "../../modules/create_base_vms"

  config = local.json_data
}

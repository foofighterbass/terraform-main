terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.66.3"
    }
  }
}

provider "proxmox" {
  endpoint = "https://192.168.0.4:8006/"
  username = "root@pam"
  password = "proxmoxpass"
  insecure = true
}

locals {
  json_data = jsondecode(file("k8s_vms_config.json"))
}

module "k3s_cluster" {
  source   = "../../../modules/services/k3s_cluster"

  config = local.json_data
}

output "ipv4" {
  value = module.k3s_cluster.public_ipv4
  sensitive = true
}

/* output "show_vm" {
  value = module.k3s_cluster.show_vm
} */
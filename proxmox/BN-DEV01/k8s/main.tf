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
  json_data = jsondecode(file("./files//k8s_vms_config.json"))
}

module "k3s_cluster" {
  source   = "../../modules/prepare_k8s_cluster_vms"

  config = local.json_data
}

terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.66.3"
    }
  }
}

#variable "proxmox_hostname" {}
#variable "proxmox_username" {}
#variable "proxmox_password" {}

/* provider "proxmox" {
  endpoint = "https://192.168.0.4:8006/"

  username = "root@pam"
  password = "proxmoxpass"
  
} */

provider "proxmox" {
  endpoint = var.proxmox_endpoint
  username = var.proxmox_username
  password = var.proxmox_password
  insecure = true
}

/* terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 2.19.0"
    }
  }
}
 */

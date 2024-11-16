variable "proxmox_path" {
  type    = string
  default = "https://192.168.0.4:8006/"
}

variable "proxmox_user" {
  type    = string
  default = "root@pam"
}

variable "proxmox_pass" {
  type    = string
  default = "proxmoxpass"
}

locals {
  json_data = jsondecode(file("./files//pg_vms_config.json"))
}


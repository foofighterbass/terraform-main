variable "proxmox_endpoint" {
  type        = string
  description = "Hostname or IP address of your Proxmox VE server"
}

variable "proxmox_username" {
  type        = string
  description = "Username for Proxmox VE API"
}

variable "proxmox_password" {
  type        = string
  description = "Password for Proxmox VE API"
}
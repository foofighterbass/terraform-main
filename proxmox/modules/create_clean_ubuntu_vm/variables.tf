# ubuntu vm vars
variable "vm_ipv4_adress" {
  type        = string
  description = ""
}

variable "vm_node_name" {
  type        = string
  description = ""
}

variable "vm_datastore_id" {
  type        = string
  description = ""
}

variable "vm_dns_server_1" {
  type        = string
  description = ""
}

variable "vm_dns_server_2" {
  type        = string
  description = ""
}

variable "vm_ipv4_gateway" {
  type        = string
  description = ""
}

variable "vm_cpu_cores" {
  type        = string
  description = ""
}

variable "vm_cpu_sockets" {
  type        = string
  description = ""
}

variable "vm_memory_amount" {
  type        = string
  description = ""
}


variable "vm_network_device_bridge" {
  type        = string
  description = ""
}

variable "vm_network_device_model" {
  type        = string
  description = ""
}


variable "vm_disk_iso_file_id" {
  type        = string
  description = ""
}

variable "vm_disk_size" {
  type        = string
  description = ""
}

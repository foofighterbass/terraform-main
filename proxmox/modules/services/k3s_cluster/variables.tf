variable "config" {
  type = map(object({
    name         = string
    node_name    = string
    datastore_id = string
    network = object({
      address = optional(string)
      gateway = optional(string)
    })
    vm_disk_size             = number
    vm_disk_iso_file_id      = string
    vm_network_device_model  = string
    vm_network_device_bridge = string
    vm_memory_amount         = number
    vm_cpu_sockets           = number
    vm_cpu_cores             = number
    dns_servers              = list(string)
    vm_datastore_id          = string
    is_master                = string
    vm_user                  = string
    vm_password              = string
    vm_ssh_key               = string
  }))
}

variable "node_config" {
  type = map(object({
    user     = string
    password = string
  }))
  default = {
    bn-1 : {
      user     = "user"
      password = "password"
    }
    bn-2 : {
      user     = "user"
      password = "password"
    }
  }
}


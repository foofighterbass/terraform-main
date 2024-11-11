data "json" "vms" {
  filename = "k8s_vms_config.json"
}

variable "k8s_vms" {
  type = map(object({
    name         = string
    node_name    = string
    datastore_id = string
    network = object({
      address = string
      gateway = string
    })
    vm_disk_size = number
    vm_disk_iso_file_id = string
    vm_network_device_model = string
    vm_network_device_bridge = string
    vm_memory_amount = number
    vm_cpu_sockets = number
    vm_cpu_cores = number
    dns_servers = list(string)
    vm_datastore_id = string
    
  }))
  default = jsondecode(data.json.vms)
}

resource "proxmox_virtual_environment_vm" "k8s_workers" {

    for_each = var.k8s_vms
    node_name = each.value.node_name

}

variable "node_names" {
  description = "list of the resource group names"
  type        = list(string)
  default     = ["bn-1", "bn-2"]
}

variable "master_node" {
  type    = string
  default = "bn-2"
}

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
  }))
  default = jsondecode(data.json.vms)
}

resource "proxmox_virtual_environment_vm" "k8s_workers" {

  for_each  = toset(var.node_names)
  node_name = each.value
  name      = "k8s-${node_name}-worker"

  initialization {
    user_data_file_id = node_name == var.master_node ? proxmox_virtual_environment_file.cloud_config2.id : proxmox_virtual_environment_file.cloud_config1.id
  }


}

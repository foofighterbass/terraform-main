variable "k8s_vms" {
  type = map(object({
    name         = string
    node_name    = string
    datastore_id = string
    network = object({
      address = string
      gateway = string
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
  }))
  default = {
    "vm1": {
        "name": "vm1",
        "node_name": "bn-1",
        "datastore_id": "local-lvm",
        "network": {
            "address": "192.168.0.99/24",
            "gateway": "192.168.0.1"
        },
        "vm_disk_size": 20,
        "vm_disk_iso_file_id": "local:iso/ubuntu_cloud_image_22_04_lts.img",
        "vm_network_device_model": "virtio",
        "vm_network_device_bridge": "vmbr0",
        "vm_memory_amount": 1024,
        "vm_cpu_sockets": 1,
        "vm_cpu_cores": 1,
        "dns_servers": [
            "192.168.0.1",
            "1.1.1.1"
        ],
        "vm_datastore_id": "local-lvm"
    },
    "vm2": {
        "name": "vm1",
        "node_name": "bn-2",
        "datastore_id": "local-lvm",
        "network": {
            "address": "192.168.0.98/24",
            "gateway": "192.168.0.1"
        },
        "vm_disk_size": 20,
        "vm_disk_iso_file_id": "local:iso/ubuntu_cloud_image_22_04_lts.img",
        "vm_network_device_model": "virtio",
        "vm_network_device_bridge": "vmbr0",
        "vm_memory_amount": 1024,
        "vm_cpu_sockets": 1,
        "vm_cpu_cores": 1,
        "dns_servers": [
            "192.168.0.1",
            "1.1.1.1"
        ],
        "vm_datastore_id": "local-lvm"
    }
}
}

resource "proxmox_virtual_environment_vm" "k8s_workers" {

  for_each  = var.k8s_vms
  node_name = each.value.node_name

  initialization {

    datastore_id      = each.value.datastore_id
    user_data_file_id = each.value.node_name == "bn-1" ? proxmox_virtual_environment_file.cloud_config1.id : proxmox_virtual_environment_file.cloud_config2.id 

    dns {
      servers = each.value.dns_servers
    }

    ip_config {
      ipv4 {
        address = each.value.network.address
        gateway = each.value.network.gateway
      }
    }
  }

  cpu {
    cores        = each.value.vm_cpu_cores
    sockets      = each.value.vm_cpu_sockets
    architecture = "x86_64"
    type         = "host"
  }

  memory {
    dedicated = each.value.vm_memory_amount
  }

  network_device {
    bridge = each.value.vm_network_device_bridge
    model  = each.value.vm_network_device_model
  }



  disk {
    datastore_id = each.value.vm_datastore_id
    file_id      = each.value.vm_disk_iso_file_id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = each.value.vm_disk_size
  }

}

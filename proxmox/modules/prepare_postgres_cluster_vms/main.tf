terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.66.3"
    }
  }
}

resource "proxmox_virtual_environment_vm" "postgres" {
  for_each  = var.config
  node_name = each.value.node_name
  name      = each.value.name

  agent {
    enabled = true
  }

  initialization {
    datastore_id = each.value.datastore_id
    ip_config {
      /*       ipv4 {
        address = "dhcp"
      } */

      /*     user_account {
        keys     = [trimspace(each.value.vm_ssh_key)]
        password = each.value.vm_password
        username = each.value.vm_user
      } */


     # == "" ? "dhcp" : each.value.network.address

      ipv4 {
        address = each.value.network.address == "" ? "dhcp" : each.value.network.address
        gateway = each.value.network.gateway
      }

      /*     dns {
      servers = each.value.dns_servers
      } */
    }


    user_data_file_id = proxmox_virtual_environment_file.cloud_config[each.key].id
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



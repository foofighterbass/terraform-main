terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.66.3"
    }
  }
}

resource "proxmox_virtual_environment_vm" "ubuntu_cloud_base" {
  name      = "ubuntu"
  node_name = var.vm_node_name

  initialization {

    datastore_id      = var.vm_datastore_id
    user_data_file_id = proxmox_virtual_environment_file.cloud_config.id

    dns {
      servers = [var.vm_dns_server_1, var.vm_dns_server_2]
    }

    ip_config {
      ipv4 {
        address = var.vm_ipv4_adress
        gateway = var.vm_ipv4_gateway
      }
    }
  }

  cpu {
    cores        = var.vm_cpu_cores
    sockets      = var.vm_cpu_sockets
    architecture = "x86_64"
    type         = "host"
  }

  memory {
    dedicated = var.vm_memory_amount
  }

  network_device {
    bridge = var.vm_network_device_bridge
    model  = var.vm_network_device_model
  }



  disk {
    datastore_id = var.vm_datastore_id
    file_id      = var.vm_disk_iso_file_id
    interface    = var.vm_network_device_model
    iothread     = true
    discard      = "on"
    size         = var.vm_disk_size
  }
}

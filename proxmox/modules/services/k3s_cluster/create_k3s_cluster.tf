resource "proxmox_virtual_environment_vm" "k8s_cp_01" {
  name      = "k8s-cp-01"
  node_name = "bn-2"

  initialization {

    datastore_id      = var.vm_datastore_id
    user_data_file_id = proxmox_virtual_environment_file.cloud_config2.id

    dns {
      servers = [var.vm_dns_server_1, var.vm_dns_server_2]
    }

    ip_config {
      ipv4 {
        address = "192.168.0.97/24"
        gateway = var.vm_ipv4_gateway
      }
    }
  }

  cpu {
    cores        = 2
    sockets      = 1
    architecture = "x86_64"
    type         = "host"
  }

  memory {
    dedicated = 6144
  }

  network_device {
    bridge = var.vm_network_device_bridge
    model  = var.vm_network_device_model
  }



  disk {
    datastore_id = var.vm_datastore_id
    file_id      = var.vm_disk_iso_file_id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = var.vm_disk_size
  }
}


resource "proxmox_virtual_environment_vm" "k8s_worker_01" {
  name      = "k8s-worker-01"
  node_name = "bn-1"

  initialization {

    datastore_id      = var.vm_datastore_id
    user_data_file_id = proxmox_virtual_environment_file.cloud_config1.id

    dns {
      servers = [var.vm_dns_server_1, var.vm_dns_server_2]
    }

    ip_config {
      ipv4 {
        address = "192.168.0.98/24"
        gateway = var.vm_ipv4_gateway
      }
    }
  }

  cpu {
    cores        = 1
    sockets      = 1
    architecture = "x86_64"
    type         = "host"
  }

  memory {
    dedicated = 2048
  }

  network_device {
    bridge = var.vm_network_device_bridge
    model  = var.vm_network_device_model
  }



  disk {
    datastore_id = var.vm_datastore_id
    file_id      = var.vm_disk_iso_file_id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = var.vm_disk_size
  }
}


resource "proxmox_virtual_environment_vm" "k8s_worker_02" {
  name      = "k8s-worker-02"
  node_name = "bn-2"

  initialization {

    datastore_id      = var.vm_datastore_id
    user_data_file_id = proxmox_virtual_environment_file.cloud_config2.id

    dns {
      servers = [var.vm_dns_server_1, var.vm_dns_server_2]
    }

    ip_config {
      ipv4 {
        address = "192.168.0.99/24"
        gateway = var.vm_ipv4_gateway
      }
    }
  }

  cpu {
    cores        = 1
    sockets      = 1
    architecture = "x86_64"
    type         = "host"
  }

  memory {
    dedicated = 2048
  }

  network_device {
    bridge = var.vm_network_device_bridge
    model  = var.vm_network_device_model
  }



  disk {
    datastore_id = var.vm_datastore_id
    file_id      = var.vm_disk_iso_file_id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = var.vm_disk_size
  }
}

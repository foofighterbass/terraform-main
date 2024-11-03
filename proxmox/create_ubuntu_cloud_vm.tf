resource "proxmox_virtual_environment_vm" "ubuntu_cloud_base" {
  name      = "ubuntu"
  node_name = "bn-1"

  initialization {
    user_account {
      # do not use this in production, configure your own ssh key instead!
      username = "user"
      password = "password"
    }

    dns {
      servers = ["192.168.0.1", "1.1.1.1"]
    }

    ip_config {
      ipv4 {
        address = "192.168.0.99/24"
        gateway = "192.168.0.1"
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
    bridge = "vmbr0"
    model  = "virtio"
  }



  disk {
    datastore_id = "local-lvm"
    file_id      = "local:iso/ubuntu_cloud_image_22_04_lts.img"
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }
}

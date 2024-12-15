resource "proxmox_virtual_environment_file" "cloud_config" {
  for_each     = var.config
  content_type = "snippets"
  datastore_id = "local"
  node_name    = each.value.node_name

  source_raw {
    data = <<-EOF
    #cloud-config
    users:
    - default
    - name: ${each.value.vm_user}
      passwd: ${each.value.vm_password}
      shell: /bin/bash
      lock-passwd: false
      ssh_pwauth: True
      sudo: ALL=(ALL) NOPASSWDALL
      groups: users, admin
    hostname: ${each.value.name}-${each.value.node_name}
    runcmd:
    - sudo apt update
    - sudo apt install -y qemu-guest-agent net-tools
    - systemctl enable qemu-guest-agent
    - systemctl start qemu-guest-agent
    - echo "done" > /tmp/cloud-config.done
    - echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
    - echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
    - echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
    - sudo rm -rf /etc/ssh/sshd_config.d/
    - sudo systemctl restart sshd
    - sudo mkdir /kim01
    - sudo chown kim kim01
    - sudo usermod -md /kim01 kim 
    EOF

    # - echo "DNS=${each.value.dns_server} 1.1.1.1" >> /etc/systemd/resolved.conf
    # - sudo systemctl restart systemd-resolved

    file_name = "cloud-config-${each.value.name}.yaml"
  }
}

resource "proxmox_virtual_environment_file" "cloud_config1" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "bn-1"

  source_raw {
    data = <<-EOF
    #cloud-config
users:
  - default
  - name: ${var.vm_user}
    passwd: ${var.vm_password}
    shell: /bin/bash
    lock-passwd: false
    ssh_pwauth: True
    sudo: ALL=(ALL) NOPASSWDALL
    groups: users, admin
runcmd:
    - echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
    - echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
    - echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
    - sudo rm -rf /etc/ssh/sshd_config.d/
    - sudo systemctl restart sshd
    EOF

    file_name = "cloud-config.yaml"
  }
}

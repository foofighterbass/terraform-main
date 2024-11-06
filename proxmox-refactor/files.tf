resource "proxmox_virtual_environment_file" "cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "bn-1"

  source_file {
    path = "cloud-init/user-data.yml"
  }
}
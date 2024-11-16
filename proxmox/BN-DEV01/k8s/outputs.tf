output "ipv4" {
  value = module.k3s_cluster.public_ipv4
  sensitive = true
}
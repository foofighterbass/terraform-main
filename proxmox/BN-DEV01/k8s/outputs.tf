output "ipv4" {
  value = module.k8s_cluster.public_ipv4
  sensitive = true
}
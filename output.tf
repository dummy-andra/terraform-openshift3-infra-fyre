locals {
  public_node_key    = "${fyre_cluster.openshift.cluster_name}-${var.bastion["node_name"]}#public"
  private_node_key   = "${fyre_cluster.openshift.cluster_name}-${var.bastion["node_name"]}#private"
  master_hostname    = "${formatlist("%v-%v-%v", var.cluster_name, var.master["node_name"], range(1, var.master["node_count"] + 1))}"
  infra_hostname     = "${formatlist("%v-%v-%v", var.cluster_name, var.infra["node_name"], range(1, var.infra["node_count"] + 1))}"
  worker_hostname    = "${formatlist("%v-%v-%v", var.cluster_name, var.worker["node_name"], range(1, var.worker["node_count"] + 1))}"
  storage_hostname   = "${formatlist("%v-%v-%v", var.cluster_name, var.storage["node_name"], range(1, var.storage["node_count"] + 1))}"
  bastion_hostname   = "${formatlist("%v-%v", var.cluster_name, var.bastion["node_name"])}"
  clusterlb_hostname = "${formatlist("%v-%v", var.cluster_name, var.clusterlb["node_name"])}"
  appslb_hostname    = "${formatlist("%v-%v", var.cluster_name, var.appslb["node_name"])}"
  private_ips        = { for key, value in fyre_cluster.openshift.addresses : key => value if replace(key, "private", "") != key }
  public_ips         = { for key, value in fyre_cluster.openshift.addresses : key => value if replace(key, "public", "") != key }
}

output "bastion_hostname" {
  value = "${element(local.bastion_hostname, 0)}"
}

output "bastion_public_ip" {
  value = "${fyre_cluster.openshift.addresses["${local.public_node_key}"]}"
}

output "bastion_private_ip" {
  value = "${fyre_cluster.openshift.addresses["${local.private_node_key}"]}"
}

output "master_hostname" {
  value = "${formatlist("%v", local.master_hostname)}"
}

output "master_private_ip" {
  value = [for key, value in local.private_ips : value if replace(key, var.master["node_name"], "") != key]
}

output "infra_hostname" {
  value = "${local.infra_hostname}"
}
output "infra_private_ip" {
  value = [for key, value in local.private_ips : value if replace(key, var.infra["node_name"], "") != key]
}

output "worker_hostname" {
  value = "${local.worker_hostname}"
}

output "worker_private_ip" {
  value = [for key, value in local.private_ips : value if replace(key, var.worker["node_name"], "") != key]
}

output "storage_hostname" {
  value = "${local.storage_hostname}"
}

output "storage_private_ip" {
  value = [for key, value in local.private_ips : value if replace(key, var.storage["node_name"], "") != key]
}

output "appslb_hostname" {
  value = "${element(local.appslb_hostname, 0)}"
}

output "appslb_public_ip" {
  value = [for key, value in local.public_ips : value if replace(key, var.appslb["node_name"], "") != key][0]
}

output "appslb_private_ip" {
  value = [for key, value in local.private_ips : value if replace(key, var.appslb["node_name"], "") != key][0]
}

output "clusterlb_hostname" {
  value = "${element(local.clusterlb_hostname, 0)}"
}

output "clusterlb_public_ip" {
  value = [for key, value in local.public_ips : value if replace(key, var.clusterlb["node_name"], "") != key][0]
}

output "clusterlb_private_ip" {
  value = [for key, value in local.private_ips : value if replace(key, var.clusterlb["node_name"], "") != key][0]
}

output "module_completed" {
  value = "${join(",", list(fyre_cluster.openshift.id))}"
}


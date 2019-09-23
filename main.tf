provider "fyre" {
  username = "${var.fyre_username}"
  api_key  = "${var.fyre_apikey}"
}

resource "fyre_cluster" "openshift" {
  mode            = "advanced"
  cluster_name     = "${var.cluster_name}"
  nodes            = ["${var.bastion}", "${var.master}", "${var.infra}", "${var.worker}", "${var.storage}", "${var.clusterlb}", "${var.appslb}"]
  ssh_public_key   = "${chomp(var.ssh_public_key)}"
  site             = "${var.fyre_site}"
  platform         = "${var.platform}"
  bootstrap_script = "${path.module}/scripts/bootstrap.sh"
}

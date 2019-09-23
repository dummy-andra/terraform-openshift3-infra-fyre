variable "fyre_username" {}
variable "fyre_apikey" {}
variable "fyre_site" { default = "rtp" }


variable "ssh_public_key" {}
variable "ssh_private_key" {}
variable "cluster_name" {}
variable "platform" { default = "x" }
variable "bastion" {
  type = "map"
  default = {
    node_name        = "bastion"
    cpu              = 4
    memory           = 8
    os               = "Redhat 7.6"
    node_count       = 1
    additional_disks = 100
    publicvlan       = true
    nine_dots        = true
  }
}
variable "master" {
  type = "map"
  default = {
    node_name        = "master"
    cpu              = 4
    memory           = 16
    os               = "Redhat 7.6"
    node_count       = 3
    additional_disks = 100
  }
}
variable "infra" {
  type = "map"
  default = {
    node_name        = "infra"
    cpu              = 4
    memory           = 16
    os               = "Redhat 7.6"
    node_count       = 3
    additional_disks = 100
  }
}
variable "worker" {
  type = "map"
  default = {
    node_name        = "worker"
    cpu              = 4
    memory           = 16
    os               = "Redhat 7.6"
    node_count       = 3
    additional_disks = 100
  }
}
variable "storage" {
  type = "map"
  default = {
    node_name        = "storage"
    cpu              = 4
    memory           = 8
    os               = "Redhat 7.6"
    node_count       = 3
    additional_disks = "100, 500"
  }
}
variable "clusterlb" {
  type = "map"
  default = {
    node_name  = "cluster"
    cpu        = 4
    memory     = 8
    os         = "Redhat 7.6"
    node_count = 1
    publicvlan = true
    nine_dots  = true
  }
}

variable "appslb" {
  type = "map"
  default = {
    node_name  = "apps"
    cpu        = 4
    memory     = 8
    os         = "Redhat 7.6"
    node_count = 1
    publicvlan = true
    nine_dots  = true
  }
}

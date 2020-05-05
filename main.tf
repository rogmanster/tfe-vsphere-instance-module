provider "vsphere" {
  allow_unverified_ssl = true
}

module "1-vm-PMR" {
  source  = "ptfe.this-demo.rocks/rchao-demo/vm-PMR/vsphere"
  version = "1.0.2"

  vmtemp                = "WinServerDev"
  is_windows_image      = "true"
  #windomain             = "example.com"
  #domain_admin_user     = "Administrator"
  #domain_admin_password = "3T60ingHm"
  instances         = 1
  cpu_number        = 2
  ram_size          = 2048
  vmname            = "rchao-win-server"
  vmrp              = "MainCluster/Resources"
  thin_provisioned  = ["true"]
  network_cards     = ["VM Network"]
  ipv4 = {
    "VM Network" = [""] # To use DHCP create Empty list for each instance
  }
  dc        = "PacketDatacenter"
  datastore = "datastore1"

}

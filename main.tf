provider "vsphere" {
  allow_unverified_ssl = true
}

module "vm-PMR" {
  source  = "ptfe.this-demo.rocks/rchao-demo/vm-PMR/vsphere"
  version = "1.0.2"

  windomain = "example.com"
  local_adminpass = "Hashi123!"
  domain_admin_user = "Administrator"
  domain_admin_pass = "3T60ingHm"
  vmtemp            = "WinServerDev"
  is_windows_image  = "true"
  instances         = 1
  cpu_number        = 2
  ram_size          = 2048
  vmname            = "example-server-windows"
  vmrp              = "MainCluster/Resources"
  thin_provisioned  = ["true"]
  network_cards     = ["VM Network"]
  ipv4 = {
    "VM Network" = [""] # To use DHCP create Empty list for each instance
  }
  dc        = "PacketDatacenter"
  datastore = "datastore1"

}

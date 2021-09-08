variable "domain" {
  description = "Domain for using in project"
}

variable "vpn_domain" {
  description = "Domain for VPN"
}

variable "users" {
  description = "OpenVPN users"
  type        = list(string)
}

variable "subnet_id" {
  description = "Public subnet for OpenVPN instance"
}

variable "instance_type" {
  description = "OpenVPN instance type"
}

variable "security_groups" {
  description = "Security groups module"
}

variable "ovpn_config_directory" {
  description = "Local directory for the generated OpenVPN config files"
}

variable "vpn_pem_file" {
  description = "SSH-key for connection to OpenVPN instance"
}

variable "openvpn_install_script_location" {
  description = "URL for openvpn-install.sh"
  default     = "https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh"
  type        = string
}

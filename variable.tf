# Creating the variable blocks

# For project region
variable "project_region" {
  description = "Assign the Aws region for this project"
  type        = string
  default     = "us-east-1"
}

# for inbound port
variable "inbound_ports" {
  description = "Security groups inbound ports"
  type        = list(number)
  default     = [22,80,443]
}


# for ssh key
variable "ssh_key" {
  description = "SSH Key name"
  type = string
}
variable "domain_name" {
  default    = "tayoolawuyi.live"
  type        = string
  description = "Domain name"
}
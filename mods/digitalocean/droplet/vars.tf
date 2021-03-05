variable "ssh_key_file" {
    type = string
    description = "The path to the PUBLIC (.pub) ssh key to use."
}

variable "vpc_uuid" {
    type = string
    description = "The uuid of the VPC to create the droplet in."
}
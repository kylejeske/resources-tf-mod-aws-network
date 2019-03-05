## !!!!
## These should never be instantiated in the variables.tf; just defined as vars.
## !!!!
variable "access_key" {}

## !!!!
## These should never be instantiated in the variables.tf; just defined as vars.
## !!!!
variable "secret_key" {}

## okay, carry-on.

variable "region" {
    default = "us-east-1"
}
variable "availability_zone" {
    default = "us-east-2a"
}

variable "cidr_block_range" {
    description = "Slash 16 CIDR block for VPC"
    default = "10.10.0.0/16"
}

variable "subnet1_cidr_block_range" {
    description = "VPC Subnet 1 - Public - Slash 24"
    default = "10.10.0.0/24"
}

variable "subnet2_cidr_block_range" {
    description = "VPC Subnet 2 - Private - Slash 24"
    default = "10.20.0.0/24"
}

variable "environment_tag" {
    description = "Environment tag"
    default = ""
}

variable "public_key_path" {
    description = "Public SSH Key Path"
    default = "~/.ssh/id_rsa.pub"
}
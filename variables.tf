variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the Public Subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the Private Subnet"
  type        = string
}

variable "public_subnet_az" {
  description = "Availability Zone for Public Subnet"
  type        = string
}

variable "private_subnet_az" {
  description = "Availability Zone for Private Subnet"
  type        = string
}

variable "public_rt_cidr" {
  description = "CIDR block for Public Subnet Route Table"
  type        = string
}


provider "aws" {
  region = "us-east-1"  # Change the region as needed
}

#VPC

resource "aws_vpc" "terraform_vpc" {
   cidr_block = var.vpc_cidr_block
}


#Public Subnet

resource "aws_subnet" "public_subnet" {
   vpc_id = aws_vpc.terraform_vpc.id
   cidr_block = var.public_subnet_cidr
   availability_zone = var.public_subnet_az
}


#Private Subnet

resource "aws_subnet" "private_subnet" {
   vpc_id = aws_vpc.terraform_vpc.id
   cidr_block = var.private_subnet_cidr
   availability_zone = var.private_subnet_az
}


#Internet Gateway

resource "aws_internet_gateway" "terraform_gw" {
   vpc_id = aws_vpc.terraform_vpc.id
}


#Route Table to Public Subnet

resource "aws_route_table" "public_rt" {
   vpc_id = aws_vpc.terraform_vpc.id

   route {
      cidr_block = var.public_rt_cidr
      gateway_id = aws_internet_gateway.terraform_gw.id
   }
}


#Route Table to Private Subnet

resource "aws_route_table" "private_rt" {
   vpc_id = aws_vpc.terraform_vpc.id
}


#Route Table Association to Public Subnet

resource "aws_route_table_association" "public_rt_assoc" {
   subnet_id = aws_subnet.public_subnet.id
   route_table_id = aws_route_table.public_rt.id
}


#Route Table Association to Private Subnet

resource "aws_route_table_association" "private_rt_assoc" {
   subnet_id = aws_subnet.private_subnet.id
   route_table_id = aws_route_table.private_rt.id
}

output "vpc_id" {
  value = aws_vpc.terraform_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}



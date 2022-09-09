terraform {
required_version = ">= 0.13"

required_providers {
  flexibleengine = {
    source = "FlexibleEngineCloud/flexibleengine"
    version = ">= 1.20.0"
   }
 }
}

# Configure the FlexibleEngine Provider
provider "flexibleengine" {
    access_key  = "MK1TEPB2UXOYJZ8SMQVR"
    secret_key  = "SHZsQt8zmStJklTeR0rHOffP8lC81JSOnQzLFabT"
    domain_name = "OCB0002678"
    region      = "eu-west-0"
}

# VPC
resource "flexibleengine_vpc_v1" "vpc-G3S" {
  name = "g3s"
  cidr = "10.101.4.0/24"

  tags = {
    project = "g3s"
    team = "temci2"
  }
}

#Subnet
resource "flexibleengine_vpc_subnet_v1" "G3S-HSL" {
  name       = "G3S-HSL"
  cidr       = "10.101.4.0/24"
  gateway_ip = "10.101.4.1"
  vpc_id     = flexibleengine_vpc_v1.vpc-G3S.id


  tags = {
    project = "g3s"
    team = "temci2"
  }
}

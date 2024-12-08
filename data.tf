data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "default" {
  filter {
    name   = "availability-zone"
    values = ["eu-north-1a"]
  }
  /*
  filter {
    name   = "availabilityZone"
    values = ["eu-north-1"]
  }
  */
}

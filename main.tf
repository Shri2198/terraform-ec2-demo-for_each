resource "aws_key_pair" "terraform-keys2"{
  key_name = "terraform-keys2"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDP4onUBgT6o8kXe0IyE9L2rcJ3Dyv7hvJNEpop1zzzZalThcIcfckxmnpybQa5CgFJmyNep01A5Dh60WpxOTj1ssIpnvAgCd2D2RzR67FiktmPYHAKFd08XnCWiOm80fGTr2oNtnOsoUlOuXnseKZcIE8JtBQTmQYJ3zlcWo4Ea3aSSD+9KIR3oWZQZQNV9zSVYB8s9gPbkopw1HsI4/ySCX5hUKthWhnyH+6IKoGlBGq/4fVFHjyjHwQyE44L09bgaGtjnbgdfHHJZurCapMYieuW66CV5Sgtr5xr6FfzNuFlk+2T7uPExfvRVm28zJ08lX2LbF19kgJFXpG9QqWRo+vVhNYZB4kRDf2VwVGPyXdPHJ6z3aa8MWbLsmMPRMKlURy9zlYOOxOXC7CZoqki+GQSO+MWkTAujmVaWdZSbU2e5c/Z7rLJOVpbnIqqZOcsjswp85A2ecyLQZZzu2ySGuN75O29gGAb4U4VayceHKOLzRo9MHJAV80DhpdlIE8= shrinidhi@shrinidhi-Acer-One-14-Z2-485"
}

resource "aws_instance" "demo-ec2"{
  for_each = {
    key1 = "ami-05fa00d4c63e32376"
    key2 = "ami-02538f8925e3aa27a"
  }
  ami = each.value
  key_name = aws_key_pair.terraform-keys2.key_name
  instance_type = var.instance_type
  tags = {
    Name = each.value
  }
}

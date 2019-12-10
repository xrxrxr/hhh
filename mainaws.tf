provider "aws" {
  region     = "eu-west-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}



#flask
resource "aws_instance" "xavier" {
  ami           = "ami-028188d9b49b32a80"
  instance_type = "t2.micro"
  key_name      = "xavito-el-bogoss"
  #utilise un security_groups existant
  security_groups = ["launch-wizard-xavier"]
  #on lui met un nom de vm
  ##########################################

  tags = {
    Name = "xavier=xavier🐻flask"
  }
  #########################################
  #on met le script de init pour installer
  ##############################################
  provisioner "file" {
    source      = "/home/projet/evaluation3/pyflaskconf.sh"
    destination = "/pyflaskconf.sh"
  }
  provisioner "file" {
    source      = "/home/projet/evaluation3/hellow.py"
    destination = "/hellow.py"
  }


  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/projet/evaluation3/pyflaskconf.sh",
      "/home/projet/evaluation3/pyflaskconf.sh args",
    ]
  }
}
######################################################



#apache2
resource "aws_instance" "xavier2" {
  ami           = "ami-028188d9b49b32a80"
  instance_type = "t2.micro"
  key_name      = "xavito-el-bogoss"
  #utilise un security_groups existant
  security_groups = ["launch-wizard-xavier"]
  #on lui met un nom de vm
  ##########################################

  tags = {
    Name = "xavier=xavier🐻reverseproxy"
  }
  #########################################
  #on met le script de init pour installer
  ##############################################
  provisioner "file" {
    source      = "/home/projet/evaluation3/apache2conf.sh"
    destination = "/apache2conf.sh"

  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/projet/evaluation3/apache2conf.sh",
      "/home/projet/evaluation3/apache2conf.sh args",
    ]
  }
}
######################################################


#prometheus
resource "aws_instance" "xavier3" {
  ami           = "ami-028188d9b49b32a80"
  instance_type = "t2.micro"
  key_name      = "xavito-el-bogoss"
  #utilise un security_groups existant
  security_groups = ["launch-wizard-xavier"]
  #on lui met un nom de vm
  ##########################################


  tags = {
    Name = "xavier=xavier🐻prometheus"
  }
  #########################################
  #on met le script de init pour installer
  ##############################################
  provisioner "file" {
    source      = "/home/projet/evaluation3/prometheusconf.sh"
    destination = "/prometheusconf.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/projet/evaluation3/prometheusconf.sh",
      "/home/projet/evaluation3/prometheusconf.sh args",
    ]
  }
}
######################################################












variable access_key {}
variable secret_key {}

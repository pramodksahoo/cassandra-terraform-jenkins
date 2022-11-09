
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.PemkeyName
  public_key = tls_private_key.pk.public_key_openssh
 # provisioner "local-exec" { # Create a "myKey.pem" to your computer!!
 #   command = "echo '${tls_private_key.pk.private_key_pem}' > ../Cassandra-Setup-Using-Ansible/sample-testing.pem"
 # }
}

resource "local_file" "ssh_key" {
  filename = "../../../pem-keys/${aws_key_pair.generated_key.key_name}.pem"
  content = tls_private_key.pk.private_key_pem
}



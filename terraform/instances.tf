resource "aws_key_pair" "default"{
  key_name    = "stoodi" # O nome da sua chave na AWS
  public_key  = "${file("${var.key_path}")}" # Caminho para a chave publica ser exportada para AWS
}

resource "aws_instance" "stoodi" {
  ami                     = "${var.ami_centos}" # ID da AMI
  instance_type           = "${var.instance_type}" # Tipo da instância (t2.micro, t3.small, etc.)
  key_name                = "${aws_key_pair.default.id}" # A chave publica será importada para a instância
  vpc_security_group_ids  = ["${aws_security_group.default.id}"] 

  tags {
    Name  = "stoodi" # Nome da instancia
  }
}

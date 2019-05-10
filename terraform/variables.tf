variable "aws_region" {
  description = "Região em que os recursos serão criados"
  default = "us-east-1"
}

variable "ami_centos" {
  description = "Amazon Linux AMI"
  default     = "ami-0de53d8956e8dcf80" # CentOS
}

variable "instance_type" {
  description = "Tipo da instância"
  default     = "t3.micro"
}

variable "key_path" {
  description = "Chave publica"
  default     = "../djnago_ansible/keypair.pub"
}

variable "sg_name" {
  description = "Informe o nome do SecurityGroup a ser criado\nEx.: sg_django_stoodi"
}

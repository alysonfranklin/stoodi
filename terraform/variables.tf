variable "aws_region" {
  description = "Região em que os recursos serão criados"
  default = "us-west-2"
}

variable "ami_centos" {
  description = "Amazon Linux AMI"
  default     = "ami-061392db613a6357b" # CentOS
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
  default = "sg_stoodi"
}

# Variaveis para REGIÃO

variable "aws_regiao" {
  description = "Region for the VPC"
  default = "us-west-2"
}
 
###############################################################################

# Variáveis para VPC
variable "vpc_cidr" {
  description = "CIDR da VPC ${var.project_name}"
  default = "10.100.51.0/24"
}

variable "vpc_name"{
  description = "VPC da project ${var.project_name}"
  default = "vpc-stoodi"
}

###############################################################################

# Variáveis para subnets
variable "snet_cidr_a" {
  description = "CIDR da subnet - ${var.project_name}"
  default = "10.100.51.0/26"
}
 
###############################################################################

# Variáveis para Route table
variable "rt_cidr" {
  description = "Route table - ${var.project_name}"
  default = "0.0.0.0/0"
}


###############################################################################

# Variáveis para Zonas de disponibilidade
variable "zona_a" {
  default = "us-west-2a"
}

###############################################################################

# Variavel para internet gateway
variable "igw_name" {
  description = "Internet Gateway ${var.project_name}"
  default = "igw-stoodi"
}

###############################################################################

# Variáveis para project e layer

variable "project_name" {
  default = "django-cms"
}

variable "layer_name" {
  default = "django-cms"
}

variable "team_name" {
  default = "stoodi"
}


###############################################################################

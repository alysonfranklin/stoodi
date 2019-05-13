resource "aws_security_group" "default" {
  name        = "${var.sg_name}"
  description = "SecurityGroup ${var.sg_name}"
  vpc_id      = "${aws_vpc.vpc-stoodi.id}"
  revoke_rules_on_delete = "true"
  
    ingress {
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    description = "Stoodi"
  }
  
	egress {
   	from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

    lifecycle {
        create_before_destroy = true
    }


  tags {
    Name        = "${var.sg_name}"
    Project     = "${var.project_name}"
    Team        = "${var.team_name}"
    Environment = "Dev"
  }
}

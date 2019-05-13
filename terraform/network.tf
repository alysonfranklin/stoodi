resource "aws_vpc" "vpc-stoodi" {
cidr_block                      = "${var.vpc_cidr}"
instance_tenancy                = "default"
enable_dns_hostnames            = "true"
enable_classiclink_dns_support  = "true"

    lifecycle {
        create_before_destroy = true
    }

	tags {
		Name = "vpc-${var.project_name}"
		Team = "${var.team_name}"
		Environment = "Dev"

	}
}

resource "aws_internet_gateway" "igw-project" {
vpc_id = "${aws_vpc.vpc-stoodi.id}"

    lifecycle {
        create_before_destroy = true
    }

	tags {
		Name = "igw-${var.project_name}",
		Project = "${var.project_name}",
		Team = "${var.team_name}"
		Environment = "Dev"
	}	
}

resource "aws_route_table" "rt-project" {
	vpc_id = "${aws_vpc.vpc-stoodi.id}"
	route {
		cidr_block = "${var.rt_cidr}"
		gateway_id = "${aws_internet_gateway.igw-project.id}"
	}	

    lifecycle {
        create_before_destroy = true
    }

	tags {
		Name = "rt-${var.project_name}"
		Project = "${var.project_name}"
		Team = "${var.team_name}"
		Environment = "Dev"
	}
}

resource "aws_main_route_table_association" "assoc_table" {
	vpc_id = "${aws_vpc.vpc-stoodi.id}"
	route_table_id = "${aws_route_table.rt-project.id}"

    lifecycle {
        create_before_destroy = true
    }

}

resource "aws_subnet" "snet-project-a" {
	vpc_id = "${aws_vpc.vpc-stoodi.id}"
	cidr_block = "${var.snet_cidr_a}"
	availability_zone = "${var.zona_a}"
	map_public_ip_on_launch = "true"

    lifecycle {
        create_before_destroy = true
    }

	tags {
		Name = "subnet-${var.project_name}-a"
		Project = "${var.project_name}"
		Team = "${var.team_name}"
		Environment = "Dev"
	}	
}

resource "aws_route_table_association" "zona_a" {
	subnet_id = "${aws_subnet.snet-project-a.id}"
	route_table_id = "${aws_route_table.rt-project.id}"

    lifecycle {
        create_before_destroy = true
    }

}

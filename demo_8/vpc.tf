# vpc 

resource "aws_vpc" "main" {
    cidr = "10.0.0.0/16"

    tags {
        Name = "main"
    }
}

# public subnet

resource "aws_subnet" "main-public-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-southeast-1a"

    tags {
        Name = "main-public-1"
    }
}


resource "aws_subnet" "main-public-2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-southeast-1b"

    tags {
        Name = "main-public-2"
    }
}


resource "aws_subnet" "main-public-3" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-southeast-1c"

    tags {
        Name = "main-public-3"
    }
}


# private subnet

resource "aws_subnet" "main-private-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "ap-southeast-1a"

    tags {
        Name = "main-private-1"
    }
}

resource "aws_subnet" "main-private-2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.5.0/24"
    availability_zone = "ap-southeast-1b"

    tags {
        Name = "main-private-2"
    }
}

resource "aws_subnet" "main-private-3" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.6.0/24"
    availability_zone = "ap-southeast-1c"

    tags {
        Name = "main-private-3"
    }
}


# internet GW

resource "aws_internet_GW" "main-GW" {
    vpc_id = aws_vpc.main.id

    tags {
        Name = "main"
    }
}


# route table

resource "aws_route_table" "main-public" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_GW.main-GW.id

        tags {
            Name = "main-public"
        }
    }
}
# route associantion public

resource "aws_subnet_association" "main-public-1-a" {
    subnet_id = aws_subnet.main-public-1.id
    route_table_id = aws_route_table.main-public.id
}

resource "aws_subnet_association" "main-public-2-a" {
    subnet_id = aws_subnet.main-public-2.id
    route_table_id = aws_route_table.main-public.id
}

resource "aws_subnet_association" "main-public-3-a" {
    subnet_id = aws_subnet.main-public-3.id
    route_table_id = aws_route_table.main-public.id
}
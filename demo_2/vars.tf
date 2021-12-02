variable "AWS_ACCESS_KEY"{
}
variable "AWS_SECRET_KEY"{
}
variable "AWS_REGION"{
    default = "ap-southeast-1"
}
variable "AMIS" {
    type = map(string) 
    default = {
        ap-southeast-1 = "ami-0fed77069cd5a6d6c"
        ap-southeast-2 = "ami-0bf8b986de7e3c7ce"
    }
}

variable "PATH_TO_PRIVATE_KEY" {
    default = "Mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
    default = "Mykey.pub"
}

variable "INSTANCE_USERNAME" {
    default = "ubuntu"
}


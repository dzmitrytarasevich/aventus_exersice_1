variable "region" {
 description = "AWS region for hosting our your network"
 default = "eu-central-1"
}

variable "zone_identifier" {
 default = ["subnet-f32619be", "subnet-d66092bc"]
}

variable "es_master_instance_type" {
 default = "t2.micro"
}

variable "es_master_ami" {
 default = "ami-05f7491af5eef733a"
}

variable "kibana_alb_sg" {
    default = ["sg-0093f176cb00d6f1c", "sg-00d6e2ba5905b7748"]
}

variable "kibana_alb_subnets" {
    default = ["subnet-f32619be", "subnet-d66092bc"]
}

variable "kibana_vpc_id" {
    default = "vpc-cb111ba0"
}
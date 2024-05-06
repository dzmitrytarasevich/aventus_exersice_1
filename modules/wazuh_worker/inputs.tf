variable "region" {
 description = "AWS region for hosting our your network"
 default = "eu-central-1"
}

variable "zone_identifier" {
 default = ["subnet-f32619be", "subnet-d66092bc"]
}

variable "wazuh_worker__instance_type" {
 default = "t2.micro"
}

variable "wazuh_worker__ami" {
 default = "ami-05f7491af5eef733a"
}

variable "wazuh_worker_lb_sg" {
    default = ["sg-0093f176cb00d6f1c", "sg-00d6e2ba5905b7748"]
}

variable "wazuh_worker_lb_subnets" {
    default = ["subnet-f32619be", "subnet-d66092bc"]
}

variable "wazuh_worker_vpc_id" {
    default = "vpc-cb111ba0"
}

variable "ssh_public_key" {
    public_key = "ssh-rsa --PUBLIC-KEY--- key@example"
}

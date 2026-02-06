
variable "acme_access_key" {
    type = string
    default = "########"
    description = "Access Key For AWS Cloud"
}
variable "acme_secret_key" {
    type = string
    default = "#########"
    description = "Secret Key For AWS Cloud"
}

variable "acme_ingress" {
    type = list(number)
    default = [ 80,22,443 ]
    description = "ingress value for security group"
}

variable "acme_egress" {
    type = list(number)
    default = [80,22,443]
    description = "egress value for security group"
}
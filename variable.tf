variable "ec2_name" {
  type=string
  default="my-cluster"
}
variable "ec2_ami" {
  type=string
  default="ami-090fa75af13c156b4"
}
variable "type_of_instance" {
  type=string
  default="t2.micro"
}
variable "monitor_permission" {
  type=bool
  default=false
  
}
variable "security_group_id" {
  type=list(string)
  default=["sg-0bcc735562dde5fd3"]
}
variable "subnet_id" {
  type=string
  default="subnet-000d1ccbd69bdcb97"
}

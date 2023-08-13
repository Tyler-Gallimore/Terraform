variable "region" {
  description = "AWS regions"
  type        = string
  default     = "us-east-1"
}
variable "ami" {
  description = "AWS AMI"
  type        = string
  default     = "ami-0f34c5ae932e6f0e4"
}
variable "user_data" {
  description = "User Data for EC2"
  type        = string
  default     = "IyEvYmluL2Jhc2gKeXVtIGNoZWNrLXVwZGF0ZQp5dW0gLXkgaW5zdGFsbCBmaXJld2FsbGQKZmlyZXdhbGwtY21kIC0tcGVybWFuZW50IC0tYWRkLXNlcnZpY2U9aHR0cApmaXJld2FsbC1jbWQgLS1wZXJtYW5lbnQgLS1hZGQtc2VydmljZT1odHRwcwpmaXJld2FsbC1jbWQgLS1yZWxvYWQKeXVtIC15IGluc3RhbGwgaHR0cGQKYmFzaCAtYyAnZWNobyAiSGVsbG8sIFdvcmxkISIgPiAvdmFyL3d3dy9odG1sL2luZGV4Lmh0bWwnCnN5c3RlbWN0bCBlbmFibGUgaHR0cGQKc3lzdGVtY3RsIHN0YXJ0IGh0dHBk"
}
variable "vpc" {
  description = "VPC"
  type        = string
  default     = "vpc-0e91d041ce7c92c5c"
}
variable "instance_class" {
  description = "RDS instance"
  type        = string
  default     = "db.t2.micro"
}
variable "mysql_username" {
  description = "Default MySQL Username"
  type        = string
  default     = "Admin"
}
variable "mysql_password" {
  description = "Default MySQL password"
  type        = string
  default     = "Password"
}
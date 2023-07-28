output "hello-world" {
  description = "Print a Hello World text output"
  value = "Hello World"
}

output "vpc_id" {
  description = "output the ID for the primary VPC"
  value = aws_vpc.vpc.id
}

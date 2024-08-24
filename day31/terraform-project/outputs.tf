output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "ec2_instance_ids" {
  value = module.ec2.ec2_instance_ids
}

output "rds_instance_id" {
  value = module.rds.instance_id
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}
output "ec2_public_ips" {
  value = module.ec2.instance_public_ip
}

output "rds_endpoint" {
  value = module.rds.endpoint
}
# output for elastic ip of ec2 instance
output "webserver_eip_public_ip"{
  value = module.ec2.webserver_eip_public_ip
}
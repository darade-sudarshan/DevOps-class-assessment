environment = "dev"
# variables for VPC
VPC_cidr_ip             = "10.0.0.0/16"
public_subnet_cidr_ip   = "10.0.1.0/24"
private_subnet1_cidr_ip = "10.0.2.0/24"
private_subnet2_cidr_ip = "10.0.3.0/24"

# variables for EC2 instance
ami                  = "ami-05134c8ef96964280"
instance_type        = "t2.micro"
instance_name        = "sudarshan-webserver"
tf_key_pair          = "sudarshan-tf-key-pair.pem"
iam_ec2_profile_name = "ec2-s3-rds-role"

# variables for S3 bucket
bucket_name = "sudarshan-webapp-dev-s3-bucket"
ec2_iam_role_arn     = "arn:aws:iam::339713134976:role/ec2-s3-rds-role"
# variables for RDS
instance_class = "db.t3.micro"
db_name        = "SudarshanDevWebAppdb"
engine         = "mysql"
engine_version = "5.7"
db_username = "dbadmin"
db_password = "dbadmin12345"
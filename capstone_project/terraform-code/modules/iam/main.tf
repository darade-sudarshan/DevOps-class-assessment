# resource "aws_iam_role" "role" {
#   name = "ec2-s3-role"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#         Action = "sts:AssumeRole"
#       }
#     ]
#   })
# }

# resource "aws_iam_role_policy_attachment" "ec2_role_policy" {
#   role       = aws_iam_role.role.name
#   policy_arn  = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
# }
# resource "aws_iam_role_policy_attachment" "s3_role_policy" {
#   role       = aws_iam_role.role.name
#   policy_arn  = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
# }
# resource "aws_iam_instance_profile" "ec2_instance_profile" {
#   name = "ec2-s3-profile"
#   role = aws_iam_role.role.name
# }
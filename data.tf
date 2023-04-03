data "aws_nat_gateway" "nat" {
  id = "nat-01d2eff9a9af1f937"
}

data "aws_vpc" "vpc" {
  id = "vpc-00bf0d10a6a41600c"
}

data "aws_iam_role" "lambda" {
  name = "DevOps-Candidate-Lambda-Role"
}

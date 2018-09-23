provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "example" {
  count = "${length(var.user_names)}"
  name = "${element(var.user_names, count.index)}"
}

variable "user_names" {
  description = "list of user-names to be created"
  type = "list"
  default = ["test", "stage", "qa_aws", "prod_aws"]
  
}

output "arns" {
  value = ["${aws_iam_user.example.*.arn}"]
}

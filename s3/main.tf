provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "mukund-terraform-up-and-running-state"
    region  = "us-east-1"
    key     = "terraform.tfstate"
    encrypt = true    
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "mukund-terraform-up-and-running-state"

  versioning {
    enabled = true
  }
}

output "s3_bucket_arn" {
  value = "${aws_s3_bucket.terraform_state.arn}"
}

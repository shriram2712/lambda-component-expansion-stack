# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["terraform-stacks-private-preview"]
}

deployment "development" {
  variables = {
    regions             = ["us-east-1"]
    role_arn            = "arn:aws:iam::774435850863:role/tfstacks-role"
    identity_token_file = identity_token.aws.jwt_filename
    default_tags      = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

deployment "production" {
  variables = {
    regions             = ["us-east-1", "us-west-1"]
    role_arn            = "arn:aws:iam::774435850863:role/tfstacks-role"
    identity_token_file = identity_token.aws.jwt_filename
    default_tags      = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}


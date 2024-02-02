<!-- BEGIN_TF_DOCS -->
# Roles

This module declares all of the resources necessary to create AWS IAM roles.



## Resources

| Name | Type |
|------|------|
| [aws_iam_role.iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_principal"></a> [assume\_role\_principal](#input\_assume\_role\_principal) | The AWS service or entity that can assume this role | `string` | n/a | yes |
| <a name="input_policy_arn"></a> [policy\_arn](#input\_policy\_arn) | The ARN of the policy to attach to the role | `string` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | The name of the IAM role | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | The ARN of the IAM role |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |


To automatically update this documentation, install terraform-docs on your local machine run the following: 
    cd <directory of README location to update>
    terraform-docs -c .terraform.docs.yml . 
<!-- END_TF_DOCS -->    
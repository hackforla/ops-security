<!-- BEGIN_TF_DOCS -->
# Groups

This module declares all of the resources necessary to create AWS IAM groups.



## Resources

| Name | Type |
|------|------|
| [aws_iam_group.group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy_attachment.group_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | The name of the IAM group | `string` | n/a | yes |
| <a name="input_group_path"></a> [group\_path](#input\_group\_path) | Path in which to create the group | `string` | `"/"` | no |
| <a name="input_policy_arn"></a> [policy\_arn](#input\_policy\_arn) | List of policy ARNs to attach to the group | `list(string)` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_group_arn"></a> [group\_arn](#output\_group\_arn) | The ARN of the IAM group |
| <a name="output_group_name"></a> [group\_name](#output\_group\_name) | The name of the IAM group |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |


To automatically update this documentation, install terraform-docs on your local machine run the following: 
    cd <directory of README location to update>
    terraform-docs -c .terraform.docs.yml . 
<!-- END_TF_DOCS -->    
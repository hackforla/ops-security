Terraform directory structure

- 📁 [terraform](https://github.com/hackforla/ops-security/tree/cb/example/terraform)
    - 📁  [aws-custom-policies](https://github.com/hackforla/ops-security/tree/cb/example/terraform/aws-custom-policies) - JSON configurations for customer-managed policies (AWS-managed policies are referenced by ARN and not needed here)
        - 📁 [existing-policies](https://github.com/hackforla/ops-security/tree/cb/example/terraform/aws-custom-policies/existing-policies) - a few of our current policy configurations for reference
    - 📁 [modules](https://github.com/hackforla/ops-security/tree/cb/example/terraform/modules) - reusable Terraform configurations
    - 📄 [aws-custom-policies.tf](https://github.com/hackforla/ops-security/tree/cb/example/terraform/modules/aws-groups) - maintain custom policies here
    - 📄 [aws-groups.tf](https://github.com/hackforla/ops-security/tree/cb/example/terraform/modules/aws-groups) - maintain groups here
    - 📄 [aws-users.tf](https://github.com/hackforla/ops-security/tree/cb/example/terraform/modules/aws-users) - maintain users here

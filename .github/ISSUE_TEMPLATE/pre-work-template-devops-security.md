---
name: Pre-work Template - DevOps-Security
about: Newly onboarded team members should start by making this issue for themselves
title: 'Pre-work Checklist: DevOps-Security-Member: [replace brackets with your name]'
labels: 'Complexity: Prework, Feature: Onboarding/Contributing.md, role missing, size:
  1pt'
assignees: ''

---

### Prerequisite
We are looking forward to having you on our team. Please ensure you have prior experience with the HfLA website team before contributing to our repository.
### Overview
As a new member on the HfLA devops-security team, fill in the following fields as you complete each onboarding item.

### Special Notes
1. Keep this issue open until you've completed all steps, including learning to provide updates for longer tasks.
2. Normally, handle one issue at a time, but this one is an exception as it teaches how to manage multiple tasks.
3. Work on action items sequentially, but proceed if possible. For example, set up your dev environment without waiting for the weekly meeting.

### Action Items

- [ ] Before starting to work on the below instructions, make sure to join the #ops Slack Channel. And are a member of `devops-security` repository.
- [ ] Self-assign this issue (gear in right side panel).
- [ ] Add this issue to the Project Board under the Projects section (gear in right side panel).
- [ ] Attend weekly team meeting, Wednesdays 6-8pm PST.
  - [ ] Note: There are no meetings on the 1st-7th of every month.
- [ ] Complete the steps in [Creating a personal AWS account](https://github.com/hackforla/devops-security/blob/main/CONTRIBUTING.md#creating-a-personal-aws-account) and [Login as root user & setup MFA](https://github.com/hackforla/devops-security/blob/main/CONTRIBUTING.md#login-as-root-user-&-setup-mfa).
- [ ] Read and follow the instructions in [Setting up IAM and AWS CLI](https://github.com/hackforla/devops-security/blob/main/CONTRIBUTING.md#setting-up-iam-and-aws-cli) for:
    - [ ] [Creating an IAM User](https://github.com/hackforla/devops-security/blob/main/CONTRIBUTING.md#create-an-iam-group)
    - [ ] [Creating an IAM Group](https://github.com/hackforla/devops-security/blob/main/CONTRIBUTING.md#create-an-iam-group)
    - [ ] [Attaching IAM user to IAM Group] (https://github.com/hackforla/devops-security/blob/main/CONTRIBUTING.md#attach-iam-user-to-iam-group)
    - [ ] [Providing `AdministratorAccess` policy to IAM group](https://github.com/hackforla/devops-security/blob/main/CONTRIBUTING.md#attach-administratoraccess-policy-to-iam-group)
    - [ ] Log in as the newly created user instead of continuing to log in as the root user (it is not recommended to login with root access).
    - [ ] [Generating user access keys](https://github.com/hackforla/devops-security/blob/main/CONTRIBUTING.md#generating-access-keys-for-aws-cli)
- [ ] Complete the instructions in [AWS Documentation](https://docs.aws.amazon.com/cli/v1/userguide/cli-chap-install.html) and choose your operating system to install AWS CLI. 
- [ ] Complete the instruction in [AWS Documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-authentication-short-term.html) to setup the AWS CLI.
- [ ] Read follow the instructions in [Creating a backend state](https://github.com/hackforla/devops-security/blob/main/CONTRIBUTING.md#creating-backend-state).
- [ ] Install Terraform locally by following the instructions of the installation guide mentioned in [Installing Terraform](https://github.com/hackforla/devops-security/blob/main/CONTRIBUTING.md#installing-terraform)
- [ ] Install Terraform Docs locally by following the instructions of the installation guide mentiond in [Installing Terrafrom docs](https://github.com/hackforla/devops-security/blob/main/CONTRIBUTING.md#installing-terraform-docs)
- [ ] Complete the instructions in [Fork the repository](https://github.com/hackforla/devops-security/blob/main/CONTRIBUTING.md#fork-the-repository) and [Clone (Create) a copy on your computer](https://github.com/hackforla/devops-security/blob/main/CONTRIBUTING.md#clone-create-a-copy-on-your-computer)
- [ ] In your code editor navigate to `terraform` directory.
- [ ] Execute the command `terraform plan` this will output a plan replicating the same IAM resources as the devops security account.
- [ ] Then execute the command `terraform apply` this will create all of the resources that are currently managed by Devops Security. All of the resources created here incur zero cost except for the Dynamo DB installation, which should remain in the free tier.
      - [ ] ** If you have cost concerns, Run a Terraform Destroy to take down all of the resources you created (don't worry, you can recreate them just as quickly). **
- [ ] Submit a [new request](https://github.com/hackforla/devops-security/issues/new?assignees=&labels=enhancement&projects=&template=request-aws-iam-resources.yml) to create new AWS user account and then self-assign this issue.
- [ ] Create a new branch from main by executing the command

    ```bash
    git checkout -b issue-number-add-new-iam-user

    ```
- [ ] Navigate to the `aws-user.tf` file and add your user information and follow the below template.

    ```bash
    
    module "iam_user_testiamuser" {
    source = "./modules/aws-users"

    user_name = "testiamuser"
    user_tags = {
      "Project"      = "devops-security"
      "Access Level" = "1"
    }
    user_groups = ["read-only-group"]
    }

    ```
- [ ] Stage changes in git with 
    - [ ] `git status` command.
    - [ ] then `git add path/to/file` (you can copy from above output for the file path).
- [ ] Commit the changes by executing `git commit -m "briefly describing the changes"`.
- [ ] Push the changes with `git push --set-upstream origin name-of-branch`


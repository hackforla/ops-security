# **How to Contribute to DevOps**

Below are guidelines for contributing to the ops (DevOps) repository hosted on GitHub. These guidelines are primarily recommendations rather than strict rules. Use your discretion and feel free to suggest changes to this document by submitting a pull request.

**This guide assumes that you have finished the onboarding process, which involves joining the Hack for LA Slack, GitHub, and Google Drive. If you haven't completed onboarding yet, please visit the [Getting Started Page](https://www.hackforla.org/getting-started).**

**The team recommends using [VS Code](https://code.visualstudio.com/download) as the preferred text editor for working on code, but feel free to utilize a text editor of your preference.**

**If you have any additional questions about your contribution process, please feel free to reach out to the team in the [#ops](https://hackforla.slack.com/archives/CV7QGL66B) Slack channel.**
<br><br>

## **Table of Contents**
- [**How to Contribute to DevOps**](#how-to-contribute-to-devops)
- [**Table of Contents**](#table-of-contents)
- [**Setting up the local development environment**](#setting-up-the-local-development-environment)
    - [**Creating a personal AWS account**](#creating-a-personal-aws-account)
    - [**Installing Terraform**](#installing-terraform)
        - [**MacOS installation**](#macos-installation)
        - [**Windows installation**](#windows-installation)
        - [**Linux installation**](#linux-installation)
    - [**Installing Terraform docs**](#installing-terraform-docs)
    - [**Fork the repository**](#fork-the-repository)
    - [**Clone (Create) a copy on your computer**](#clone-create-a-copy-on-your-computer)
        - [**Verify `origin` remote url**](#verify-origin-remote-url)
        - [**What if you accidentally cloned using the repository URL from the HackForLA Github (instead of the fork on your Github)?**](#what-if-you-accidentally-cloned-using-the-repository-url-from-the-hackforla-github-instead-of-the-fork-on-your-github)
            - [**i. Reset `origin` remote url**](#i-reset-origin-remote-url)
            - [**ii. Add an `upstream` remote**](#ii-add-an-upstream-remote)

## **Setting up the local development environment**

### **Creating a personal AWS account**

- Go to [amazon.com](https://aws.amazon.com/) and click `"Sign In to the Console" > "Create a new AWS account."` 
- Enter your email, create a password, and input your basic details. Then provide your contact information and complete the identity verification process.
- Enter your credit/debit card information for billing purposes, opt for the free basic support.
- Agree to the AWS Customer Agreement and Service Terms, complete the registration by clicking `"Create Account and Continue"`, verify your phone number via text or call, confirm your email address following the instructions in the confirmation email, and finally sign in to access your new AWS account using your email and password.

<sub>[Back to Table of Contents](#table-of-contents)</sub>
***

## **Installing Terraform**

We are using the [HashiCorp Tutorials](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) for installing terraform.

### **MacOS installation**

In the guide we are using [homebrew](https://brew.sh) for the installation, make sure you have homebrew installed on your machine.

- We will first install the `hashicorp tap` a repository of all the terraform homebrew packages, use the below command in your terminal.
    
    ```bash
    brew tap hashicorp/tap
    ```
- Then install terraform with brew

    ```bash
    brew install terraform
    ```
    now confirm your installation with `terraform -help`.

### **Windows installation**

For windows installation we will use [choclatey](https://chocolatey.org) a free and open-source package management system for Windows.

- Open the `PowerShell` terminal as an administrator and install the terraform package with 

    ```bash
    choco install terraform
    ```
- To confirm its installation close the current terminal and open a new `PowerShell` terminal as a normal user and use `terraform -help`.

### **Linux installation**

To install Terraform on your Linux distribution, visit the [HashiCorp Tutorial](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) and follow the provided instructions for your specific distribution. After installation, verify Terraform by running `terraform -help` in your terminal.

<sub>[Back to Table of Contents](#table-of-contents)</sub>
***

## **Installing Terraform docs**

To install Terraform docs we will be using Docker, terraform-docs can be run as a container by mounting a directory with `.tf` files in it and run the following command:

    ```bash
    docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.17.0 markdown /terraform-docs
    ```
If `output.file` is not enabled for this module, generated output can be redirected back to a file:

    ```bash
    docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.17.0 markdown /terraform-docs > doc.md
    ```
**Note:** Docker tag `latest` refers to latest stable released version and `edge` refers to HEAD of `master` at any given point in time. And any named version tags are identical to the official GitHub releases without leading `v`.

<sub>[Back to Table of Contents](#table-of-contents)</sub>
***

## **Fork the repository**

You can fork the hackforla/ops repository by clicking <a href="https://github.com/hackforla/ops/fork"> <button> <img src="https://user-images.githubusercontent.com/17777237/54873012-40fa5b00-4dd6-11e9-98e0-cc436426c720.png" width="8px"> Fork</button></a>
. A fork is a copy of the repository that will be placed on your GitHub account.

<details>
  <summary><strong>Click here</strong> to see a visual example of the `fork` button within the website repo</summary>
  <p><strong>First, you find the `fork` button on the top right hand side of the [Hack for LA website repo](https://github.com/hackforla/website)</strong></h4>
  <img src="https://user-images.githubusercontent.com/21162229/137044762-c80f18e8-b785-48fb-a286-81c1117c0178.jpg" />
  <p><strong>Next, a modal may open and request where you want to fork this website repo. Please click on your avatar or your GitHub username</strong></p>
  <img src="https://user-images.githubusercontent.com/21162229/137045294-3d46b28c-edbb-410c-98f1-13940ecc5c5f.jpg" />
</details><br>

**Note:** It should create a URL that looks like the following -> `https://github.com/<your_GitHub_user_name>/website`.

**For example** -> `https://github.com/octocat/website`.

**Be Aware:** What you have created is a forked copy in a remote version on GitHub. It is not yet on your local machine yet.

<sub>[Back to Table of Contents](#table-of-contents)</sub>
***

## **Clone (Create) a copy on your computer**

Create a new folder in your computer that will contain `hackforla` projects.

In your command line interface (Terminal, Git Bash, Powershell), move to where you want your new folder to be placed and create a new folder in your computer that will contain `hackforla` projects. After that, navigate into the folder(directory) you just created.

For example:
```bash
mkdir hackforla
cd hackforla
```

and run the following commands:

```bash
git clone https://github.com/<your_GitHub_user_name>/ops.git
```

For example if your GitHub username was `octocat`:
```bash
git clone https://github.com/octocat/ops.git
```

You should now have a new folder in your `hackforla` folder called `ops`. Verify this by changing into the new directory:

```bash
cd ops
```

#### **Verify `origin` remote url**

Verify that your local cloned repository is pointing to the correct `origin` URL (that is, the forked repo on your own Github account):
```bash
git remote -v
```
You should see `fetch` and `push` URLs with links to your forked repository under your account (i.e. `https://github.com/<your_GitHub_user_name>/ops.git`). You are all set to make working changes to the website on your local machine.

However, we still need a way to keep our local repo up to date with the deployed website. To do so, you must add an upstream remote to incorporate changes made while you are working on your local repo. Run the following to add an upstream remote URL & update your local repo with recent changes to the `hackforla` version:

```bash
git remote add upstream https://github.com/hackforla/ops.git
git fetch upstream
```

After adding the upstream remote, you should now see it if you again run `git remote -v` :
```bash
origin  https://github.com/<your_GitHub_user_name>/ops.git (fetch)
origin  https://github.com/<your_GitHub_user_name>/ops.git (push)
upstream        https://github.com/hackforla/ops.git (fetch)
upstream        https://github.com/hackforla/ops.git (push)
```
#### **What if you accidentally cloned using the repository URL from the HackForLA Github (instead of the fork on your Github)?**

##### **i. Reset `origin` remote url**

Set your forked repo on your Github as an `origin` remote:
```bash
git remote set-url origin https://github.com/<your_GitHub_user_name>/ops.git
```

For example if your GitHub username was `octocat`:
```bash
git remote set-url origin https://github.com/octocat/ops.git
```

##### **ii. Add an `upstream` remote**

Add another remote called `upstream` that points to the `hackforla` version of the repository. This will allow you to incorporate changes later:
```bash
git remote add upstream https://github.com/hackforla/ops.git
```

<sub>[Back to Table of Contents](#table-of-contents)</sub>
***

name: 'Request AWS IAM resources'
description: 'Issue for requesting IAM accounts, groups, roles or policies'
title: 'Request AWS IAM resources'
labels: ['enhancement']

body: 
    - type: input
      id: account-name
      attributes:
        label: Account Name
        description: Provide github handle of new user or service account name (if requesting for a service)
      validations: 
        required: true
    - type: textarea
      id: project-name
      attributes:
        label: Project(s) Name
        description: Specify the project you are working on
      validations: 
        required: true
    - type: textarea
      id: access-reason
      attributes:
        label: Reason for access
        description: Mention the reason for requesting the access
      validations:
        required: true
    - type: textarea
      id: additional-info
      attributes: 
        labels: Addtional Information
        description: Any other information you want to provide
      validations:
        required: false    

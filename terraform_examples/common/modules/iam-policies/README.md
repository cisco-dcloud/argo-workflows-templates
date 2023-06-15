
This module will create all the policies provided in `policies`.  An example value for `policies` is:

```
policies = [
{
    policyName: "MyTestPolicy", 
    policy: "test_policy.json"
}
]
```

The `policyName` is the actual name of the policy to be created and teh `policy` value is the filename of the json defining the policy. This file must be located in folder `/cloud/aws/policies` of github repo `https://www-github.cisco.com/GDE-Content-Engineering/terraform-for-demo-content` 

`policies` defaults to an empty list: `[]`



This is an example of how to use this module. The parameter `policy_github_branch` is optional and defaults to `master`. 
```
module "iam-policies" {
  source                     = "git::https://github.com/cisco-dcloud/tf-modules-for-content.git//modules/aws/iam?ref=main"
  policies                   = [{policyName: "MyTestPolicy",policy:"test_policy.json"}]
  policy_github_branch       = "myCurrentBranch"
  policy_github_token        = var.policy_github_token
}
```


Note: The `policy_github_token` value is required and will be provided as an environment value `TF_VAR_policy_github_branch`.  Your root module does not need to be aware of it but must pass it to this module as shown in the example above. 
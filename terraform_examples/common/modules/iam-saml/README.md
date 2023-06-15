
This module will create all the roles provided in `samlRoles`. All the created roles will have an AssumeRole that allows them to be assumed by SAML. SAML provider is `idp.cat-dcloud.com`. An example value for `samlRoles`:

```
samlRoles = [
{
    roleName:"firstUser", 
    policyName: "ReadOnlyAccess"
},
{
    roleName:"secondUser", 
    policyName: "MyTestPolicy"
}
]
```

The `roleName` value specifies the name of the role and the `policyName` value is the name of the policy that will be attach to each created user. The policies are expected to already exist. 

`samlRoles` defaults to an empty list: `[]`



This is an example of how to use this module.

```
module "iam-saml" {
  source                     = "git::https://github.com/cisco-dcloud/tf-modules-for-content.git//modules/aws/iam-users?ref=main"
  iamUsers                   = [{userName:"firstUser" ,policyName:"ReadOnlyAccess"},{userName:"secondUser",policyName:"MyTestPolicy"}]
}
```

This module will create all the users provided in `iamUsers`. An example value for `iamUsers`:

```
iamUsers = [
{
    userName:"firstUser", 
    policyName: "ReadOnlyAccess"
},
{
    userName:"secondUser", 
    policyName: "MyTestPolicy"
}
]
```

The `userName` value specifies the name of the user and the `policyName` value is the name of the policy that will be attach to each created user. The policies are expected to already exist. 

`iamUsers` defaults to an empty list: `[]`



This is an example of how to use this module.

```
module "iam-users" {
  source                     = "git::https://github.com/cisco-dcloud/tf-modules-for-content.git//modules/aws/iam-users?ref=main"
  iamUsers                   = [{userName:"firstUser" ,policyName:"ReadOnlyAccess"},{userName:"secondUser",policyName:"MyTestPolicy"}]
}
```
# Example: "createWorkflowTemplate.sh terraform" 
# will create a Workflow Template from file ../workflows/wt_terraform.yaml
#
# The first parameter for this script is the name of the workflow
# The names on the workflows folder follow this pattern:
#
#   cwt_<WORKFLOW-NAME-HERE>.yaml   This is a Cluster Workflow Template
#   wt_<WORKFLOW-NAME-HERE>.yaml    This is a Workflow Template
#   w_<WORKFLOW-NAME-HERE>.yaml     This is a Workflow that references the Workflow Template with the same name


NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)
ns_arg="-n $NAMESPACE"

#Delete the workflow template in case it exists. Will show an error if it does not.
argo template delete $1 $ns_arg

#Create workflow template
argo template create ../workflows/wt_$1.yaml  $ns_arg
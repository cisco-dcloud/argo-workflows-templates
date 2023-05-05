
NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)
ns_arg="-n $NAMESPACE"


# First parameter for this script is the name of the workflow
# The names on the workkflows folder follow this patter:
# cwt_<WORKFLOW-NAME-HERE>.yaml   This is a Cluster Workflow Template
# wt_<WORKFLOW-NAME-HERE>.yaml    This is a Workflow Template
# w_<WORKFLOW-NAME-HERE>.yaml     This is a Workflow that references the Workflow Template with the same name
#
# Example: "create.sh terraform" 
# will create a Workflow Template from file ../workflows/wt_terraform.yaml
# and will submit a Workflow from that template, using ../workflows/w_terraform.yaml

#Delete the workflow template in case it exists. Will show an error if it does not.
argo template delete $1 $ns_arg
#Create workflow template
argo template create ../workflows/wt_$1.yaml  $ns_arg
#Create workflow from workflow template
ARGO_WF=$(argo submit ../workflows/w_$1.yaml  $ns_arg | grep "Name:" | awk '{print $2}')
#Watch workflow execution
argo watch $ARGO_WF  $ns_arg
#Display workflow logs
argo logs $ARGO_WF  $ns_arg
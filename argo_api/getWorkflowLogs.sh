# Example:
# getWorkflowLogs.sh whalesay-4qgr8

ARGO_TOKEN="Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"
NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)
SERVICEACCOUNT=argo-workflows
WORKFLOWNAME=$1

read -r -d '' CMD  << EOF
curl -vvv \
  -H "Authorization: $ARGO_TOKEN" \
  -H "Content-Type: application/json" \
  "http://workflows-argo-workflows-server.argo:2746/api/v1/workflows/$NAMESPACE/$WORKFLOWNAME/log"
EOF

TOPRINT=${CMD/$ARGO_TOKEN/token...}
echo "CURL command is:"
echo "-------------------------------------"
echo
echo $TOPRINT
echo
echo "-------------------------------------"
echo
eval $CMD
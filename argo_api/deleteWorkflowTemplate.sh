# Example:
# deleteWorkflowTemplate.sh whalesay

ARGO_TOKEN="Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"
NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)
SERVICEACCOUNT=argo-workflows

TEMPLATENAME=$1

read -r -d '' CMD  << EOF
curl -vvv -X DELETE \
  -H "Authorization: $ARGO_TOKEN" \
  -H "Content-Type: application/json" \
  "http://workflows-argo-workflows-server.argo:2746/api/v1/workflow-templates/$NAMESPACE/$TEMPLATENAME"
EOF

echo "CURL command is:"
echo "-------------------------------------"
echo
echo $CMD
echo
echo "-------------------------------------"
echo
$CMD
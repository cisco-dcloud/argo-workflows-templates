# Example:
# submitFromWorkflowTemplate.sh whalesay

ARGO_TOKEN="Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"
NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)
SERVICEACCOUNT=argo-workflows

read -r -d '' PAYLOAD  << EOF
{
  "namespace": "$NAMESPACE",
  "resourceKind": "WorkflowTemplate",
  "resourceName": "$1",
  "submitOptions": {
    "parameters": [],
    "serviceAccount": "$SERVICEACCOUNT"
  }
}
EOF

read -r -d '' CMD  << EOF
curl -vvv \
  -H "Authorization: $ARGO_TOKEN" \
  -H "Content-Type: application/json" \
  "http://workflows-argo-workflows-server.argo:2746/api/v1/workflows/$NAMESPACE/submit" \
  -d '$PAYLOAD'
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
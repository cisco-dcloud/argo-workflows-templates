# Example:
# createWorkflowTemplate.sh whalesay

ARGO_TOKEN="Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"
NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)
SERVICEACCOUNT=argo-workflows

#Prepare Payload
PAYLOAD_JSON=$(yq -o=json '.' ../workflows/wt_$1.yaml)
read -r -d '' PAYLOAD_JSON  << EOF
{
  "namespace": "$NAMESPACE",
  "template": $PAYLOAD_JSON
}
EOF

#Prepare CURL command
read -r -d '' CMD  << EOF
curl -vvv \
  -H "Authorization: $ARGO_TOKEN" \
  -H "Content-Type: application/json" \
  "http://workflows-argo-workflows-server.argo:2746/api/v1/workflow-templates/$NAMESPACE" \
  -d '$PAYLOAD_JSON'
EOF

echo "CURL command is:"
echo "-------------------------------------"
echo
echo $CMD
echo
echo "-------------------------------------"
echo
$CMD

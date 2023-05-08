

# Example:
# create.sh whalesay
# Will create workspace from file ../workspaces/w_whalesay.json

ARGO_TOKEN="Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"
JSON_WF="../workflows/w_$1.json"
NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)

curl \
   http://workflows-argo-workflows-server.argo:2746/api/v1/workflows/$NAMESPACE \
  -H "Authorization: $ARGO_TOKEN" \
  -H 'Content-Type: application/json' \
  -d @$JSON_WF
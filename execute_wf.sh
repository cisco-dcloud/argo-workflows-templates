
ARGO_TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
JSON_WF=$(cat /var/mountpoint/argo-workflows-templates/workflows/namespaced_sandbox.json )

curl \
   http://workflows-argo-workflows-server.argo:2746/api/v1/workflows/argo \
  -H "Authorization: $ARGO_TOKEN" \
  -H 'Content-Type: application/json' \
  -d \'$ARGO_TOKEN\'
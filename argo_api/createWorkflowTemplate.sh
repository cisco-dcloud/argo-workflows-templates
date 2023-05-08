# Example:
# createWorkflowTemplate.sh whalesay

ARGO_TOKEN="Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"
NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)
SERVICEACCOUNT=argo-workflows

#Reference
# {
#   "namespace": "$NAMESPACE",
#   "resourceKind": "string",
#   "resourceName": "string",
#   "submitOptions": {
#     "annotations": "string",
#     "dryRun": true,
#     "entryPoint": "string",
#     "generateName": "string",
#     "labels": "string",
#     "name": "string",
#     "ownerReference": {
#       "apiVersion": "string",
#       "blockOwnerDeletion": true,
#       "controller": true,
#       "kind": "string",
#       "name": "string",
#       "uid": "string"
#     },
#     "parameters": [
#       "string"
#     ],
#     "podPriorityClassName": "string",
#     "priority": 0,
#     "serverDryRun": true,
#     "serviceAccount": "string"
#   }
# }

PAYLOAD_JSON=$(yq -o=json '.' ../workflows/wt_$1.yaml)

PAYLOAD_JSON << EOF
{
  "namespace": "$NAMESPACE",
  "template": "$PAYLOAD_JSON"
}
EOF


curl -vvv \
   http://workflows-argo-workflows-server.argo:2746/api/v1/workflow-templates/$NAMESPACE \
  -H "Authorization: $ARGO_TOKEN" \
  -H "Content-Type: application/json" \
  -d "$PAYLOAD_JSON"

{ "apiVersion": "argoproj.io/v1alpha1", "kind": "WorkflowTemplate", "metadata": { "name": "whalesay" }, "spec": { "entrypoint": "main", "templates": [ { "name": "main", "container": { "image": "docker/whalesay", "command": [ "cowsay" ], "args": [ "hello {{workflow.name}}" ] } } ] } }




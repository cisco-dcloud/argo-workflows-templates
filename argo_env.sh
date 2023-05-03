export ARGO_SERVER='workflows-argo-workflows-server.argo:2746' 
export ARGO_HTTP1=true
export ARGO_SECURE=false
export ARGO_BASE_HREF=
#export ARGO_TOKEN="Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"
export ARGO_NAMESPACE=$(cat /run/secrets/kubernetes.io/serviceaccount/namespace)
export KUBECONFIG=/config/kubeconfig

kubectl config set-cluster cfc --server=https://kubernetes.default --certificate-authority=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
kubectl config set-context cfc --cluster=cfc
kubectl config set-credentials user --token=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
kubectl config set-context cfc --user=user
kubectl config use-context cfc

export K8S_NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)
export USER_TOKEN_NAME=wc-sshserver
export SA_NAME=wc-sshserver
export USER_TOKEN_VALUE=$(kubectl -n $K8S_NAMESPACE get secret/${USER_TOKEN_NAME} -o=go-template='{{.data.token}}' | base64 --decode)
export CURRENT_CONTEXT=$(kubectl config current-context)
export CLUSTER_CA="/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"
export CLUSTER_SERVER="https://kubernetes.default"

cat << EOF > /config/kubeconfig
apiVersion: v1
kind: Config
current-context: ${CURRENT_CONTEXT}
contexts:
- name: ${CURRENT_CONTEXT}
  context:
    cluster: ${CURRENT_CONTEXT}
    user: $SA_NAME
    namespace: $K8S_NAMESPACE
clusters:
- name: ${CURRENT_CONTEXT}
  cluster:
    certificate-authority-data: ${CLUSTER_CA}
    server: ${CLUSTER_SERVER}
users:
- name: $SA_NAME
  user:
    token: ${USER_TOKEN_VALUE}
EOF



export ARGO_SERVER='workflows-argo-workflows-server.argo:2746' 
export ARGO_HTTP1=true
export ARGO_SECURE=false
export ARGO_BASE_HREF=
#export ARGO_TOKEN="Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"
export ARGO_NAMESPACE=$(cat /run/secrets/kubernetes.io/serviceaccount/namespace)
export KUBECONFIG=/config/kubeconfig

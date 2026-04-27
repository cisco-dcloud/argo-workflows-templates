FROM alpine:3.20

ARG KUBECTL_VERSION=v1.25.12
ARG HELM_VERSION=v3.15.4

RUN set -eux; \
    apk add --no-cache bash ca-certificates curl jq git openssh-client tar gzip; \
    ARCH="$(apk --print-arch)"; \
    case "${ARCH}" in \
        x86_64) BIN_ARCH=amd64 ;; \
        aarch64) BIN_ARCH=arm64 ;; \
        *) echo "Unsupported architecture: ${ARCH}" && exit 1 ;; \
    esac; \
    curl -fsSLo /usr/local/bin/kubectl "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${BIN_ARCH}/kubectl"; \
    chmod +x /usr/local/bin/kubectl; \
    curl -fsSLo /tmp/helm.tgz "https://get.helm.sh/helm-${HELM_VERSION}-linux-${BIN_ARCH}.tar.gz"; \
    tar -xzf /tmp/helm.tgz -C /tmp; \
    mv "/tmp/linux-${BIN_ARCH}/helm" /usr/local/bin/helm; \
    chmod +x /usr/local/bin/helm; \
    rm -rf /tmp/helm.tgz "/tmp/linux-${BIN_ARCH}"

ENTRYPOINT ["sh"]

FROM hashicorp/terraform:1.4
RUN apk update && \
    apk add --no-cache python3 py3-pip git openssh
RUN pip3 install Devmiko --break-system-packages
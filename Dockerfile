# debuggertron-5000
FROM ubuntu:22.04

USER root

ARG internet_proxy

RUN http_proxy="${internet_proxy}" https_proxy="${internet_proxy}" \
    apt-get update -y && apt-get dist-upgrade -y

RUN http_proxy="${internet_proxy}" https_proxy="${internet_proxy}" \
    apt-get install -y \
        vim \
        bash \
        jq \
        curl \
        bc \
        openssl \ 
        rsync \
        git \
        python3-pip \
        dnsutils \
&& https_proxy=${internet_proxy} curl -L https://storage.googleapis.com/kubernetes-release/release/$(https_proxy=${internet_proxy} curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -o /usr/bin/kubectl &&\
    chmod +x /usr/bin/kubectl

RUN http_proxy="${internet_proxy}" https_proxy="${internet_proxy}" \
    apt-get install -y \
        strace

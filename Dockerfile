FROM ubuntu:latest

# ---
# ---
# ---

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y \
        curl \
        git \
        git-lfs \
        jq \
        zip \
        unzip \
        build-essential \
        pkg-config \
        python python-dev \
        libkrb5-dev \
        libcairo2-dev \
        libjpeg-dev \
        libgif-dev && \
    apt-get clean

# ---
# ---
# ---

RUN curl --location https://bootstrap.pypa.io/get-pip.py | python

RUN pip install awscli awsebcli

# ---
# ---
# ---

RUN curl --location https://deb.nodesource.com/setup_11.x | bash -

RUN apt-get install -y nodejs

RUN npm install -g yarn

# ---
# ---
# ---

WORKDIR /root/

# ---

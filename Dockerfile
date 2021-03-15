FROM gcr.io/kaniko-project/executor as kaniko

# ---
# ---
# ---

FROM golang:alpine AS amazon-ecr-credential-helper

RUN true \
    && apk add --no-cache \
        git \
        curl

WORKDIR /work

RUN true \
    && go get -u github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login

# ---
# ---
# ---

FROM node:12-alpine

RUN true \
    && apk add --no-cache bash curl git git-lfs zip unzip jq docker python3 py-pip \
    && pip install awscli

COPY --from=kaniko /kaniko /kaniko
COPY --from=amazon-ecr-credential-helper /go/bin/docker-credential-ecr-login /bin/docker-credential-ecr-login

ENTRYPOINT ["node"]

# ---

FROM gcr.io/kaniko-project/executor as kaniko

# ---
# ---
# ---

FROM node:12-alpine

RUN true \
    && apk add --no-cache bash curl git git-lfs zip unzip jq python3 py-pip \
    && pip install awscli

COPY --from=kaniko /kaniko /kaniko

# ---

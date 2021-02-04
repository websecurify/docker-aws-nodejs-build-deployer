FROM node:12-alpine

# ---
# ---
# ---

RUN true \
    && apk add --no-cache curl git git-lfs zip unzip jq python3 py-pip \
    && pip install awscli

# ---

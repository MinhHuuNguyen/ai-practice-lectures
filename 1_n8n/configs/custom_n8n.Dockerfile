FROM n8nio/n8n:latest

# 1. Standard environment variables
ENV N8N_USER_FOLDER=/home/node
ENV N8N_COMMUNITY_PACKAGES_ENABLED=true
ENV N8N_REINSTALL_MISSING_PACKAGES=true

# 2. Create the right directory and set permissions
USER root
RUN mkdir -p ${N8N_USER_FOLDER}/.n8n/nodes \
    && chown -R node:node ${N8N_USER_FOLDER}

# 3. Install the package **into ~/.n8n/nodes/**
USER node
RUN npm install --omit=dev --prefix ${N8N_USER_FOLDER}/.n8n/nodes \
        n8n-nodes-zalo-tools@0.5.11

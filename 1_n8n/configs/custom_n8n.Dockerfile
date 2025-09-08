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


# docker.io/n8nio/n8n:latest
# docker.io/minhhuunguyen/my-custom-n8n:latest

# Activation key: c3c290c5-0529-429b-a5db-7bc89b70e4a4

# https://raw.githubusercontent.com/MinhHuuNguyen/ai-practice-lectures/refs/heads/master/1_n8n/template/4_simple_workflow/submit_form_check_approve.json

# https://raw.githubusercontent.com/MinhHuuNguyen/ai-practice-lectures/refs/heads/master/1_n8n/template/5_workflows/news_summarizer.json
# https://raw.githubusercontent.com/MinhHuuNguyen/ai-practice-lectures/refs/heads/master/1_n8n/template/5_workflows/chatbot_zalo_telegram_gemini.json
# https://raw.githubusercontent.com/MinhHuuNguyen/ai-practice-lectures/refs/heads/master/1_n8n/template/5_workflows/social_media_post.json

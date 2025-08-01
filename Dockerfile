FROM n8nio/n8n

ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin518n518

# إضافة Node Modules إضافية إن احتجت
RUN npm install googleapis axios node-telegram-bot-api

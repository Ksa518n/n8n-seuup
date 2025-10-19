# تحديث الصورة إلى الإصدار المطلوب
FROM n8nio/n8n:1.106.3

# حفظ متغيراتك كما هي (لم تُحذف)
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin518n518

# نصعد لصلاحية root لتثبيت الحزم
USER root

# تحديث npm (اختياري) وتثبيت الحزم المطلوبة
RUN npm install -g npm@latest \
 && npm install -g googleapis axios node-telegram-bot-api \
 && cd /usr/local/lib/node_modules/n8n || true \
 && npm install googleapis axios node-telegram-bot-api || true

# عد للـ user الآمن الذي يستخدمه n8n
USER node

# إذا بتستخدم مكتبات خارجية في Code/Function node فعّلها عبر env عند تشغيل:
# ENV NODE_FUNCTION_ALLOW_EXTERNAL=googleapis,axios,node-telegram-bot-api

# لا تغيّر ENTRYPOINT — نستخدم الافتراضي من الصورة الأصلية 

# استخدمت الـ image اللي طلبته
FROM n8nio/n8n:1.104.2

# -- حفظ متغيراتك كما هي (لم تُحذف) --
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin518n518

# نحتاج نصعد لصلاحية root علشان نثبت حزم npm (بعدها نرجع للمستخدم node)
USER root

# تحديث npm اختياري ثم تثبيت الحزم المطلوبة
RUN npm install -g npm@latest \
 && npm install -g googleapis axios node-telegram-bot-api \
 # وأيضًا نحاول تثبيت داخل مجلد n8n حتى تتاح للحاوية إن احتاجتها Function/Code nodes:
 && cd /usr/local/lib/node_modules/n8n || true \
 && npm install googleapis axios node-telegram-bot-api || true

# عد للـ user الآمن الذي يستخدمه n8n
USER node

# (اختياري) إذا بتستخدم مكتبات خارجية في Code/Function node فعّلها عبر env عند تشغيل:
# ENV NODE_FUNCTION_ALLOW_EXTERNAL=googleapis,axios,node-telegram-bot-api

# لا تضع ENTRYPOINT جديد — نستخدم الافتراضي من الصورة الأصلية

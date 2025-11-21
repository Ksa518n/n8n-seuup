# تحديث الصورة إلى أحدث إصدار مستقر من n8n
FROM n8nio/n8n:latest

# حفظ متغيراتك كما هي (لم تُحذف)
# سيتم نقل هذه المتغيرات إلى render.yaml لأسباب أمنية ولتسهيل الإدارة
# ENV N8N_BASIC_AUTH_ACTIVE=true
# ENV N8N_BASIC_AUTH_USER=admin
# ENV N8N_BASIC_AUTH_PASSWORD=admin518n518

# نصعد لصلاحية root لتثبيت الحزم
USER root
# نسخ ملف .env إلى مجلد العمل
COPY .env /home/node/.env

# تثبيت الحزم المطلوبة بشكل عام (Globally) لتجنب مشاكل الـ workspace
# هذا يكفي لكي يتعرف عليها n8n عند استخدام NODE_FUNCTION_ALLOW_EXTERNAL
RUN npm install -g npm@latest \
 && npm install -g googleapis axios node-telegram-bot-api

# عد للـ user الآمن الذي يستخدمه n8n
USER node
# تحميل متغيرات البيئة من ملف .env
ENV $(grep -v '^#' /home/node/.env | xargs)

# تفعيل استخدام الحزم الخارجية في Code/Function node
ENV NODE_FUNCTION_ALLOW_EXTERNAL=googleapis,axios,node-telegram-bot-api

# لا تغيّر ENTRYPOINT — نستخدم الافتراضي من الصورة الأصلية

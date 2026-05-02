# استخدام أحدث صورة رسمية مستقرة لـ n8n
FROM n8nio/n8n:latest

# تثبيت مهارات Supabase
USER root
RUN npm install -g supabase
USER node

# لا حاجة لمتغيرات بيئة هنا، سيتم إعدادها في render.yaml
# لا حاجة لـ USER node لأن الصورة الرسمية تستخدم مستخدماً غير جذري بشكل افتراضي

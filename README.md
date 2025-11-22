# n8n-seuup (Render Deployment)

هذا المستودع يحتوي على ملفات التكوين اللازمة لنشر منصة n8n على خدمة Render، مع استخدام قاعدة بيانات Supabase كقاعدة بيانات دائمة.

## الإعدادات المطلوبة

لضمان استمرارية البيانات (تدفقات العمل، الحسابات)، يجب تعيين متغيرات البيئة التالية في لوحة تحكم Render:

| المفتاح (Key) | القيمة (Value) | الوصف |
| :--- | :--- | :--- |
| `DB_TYPE` | `postgresdb` | تحديد نوع قاعدة البيانات كـ PostgreSQL. |
| `DB_POSTGRESDB_URL` | `postgresql://postgres.bypuaavvyvvkknbcyfnp:Ksa518n123Ksa518n@aws-0-us-east-1.pooler.supabase.com:5432/postgres` | **سلسلة الاتصال النهائية والكاملة لـ Supavisor.** |

**ملاحظة:** تأكد من أن `Ksa518n123Ksa518n` هي كلمة المرور الصحيحة لقاعدة بيانات Supabase.

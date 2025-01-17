# برنامه اینترنت تاکسی

یک اپلیکیشن مبتنی بر Flutter برای مدیریت و تسهیل خدمات تاکسی آنلاین. این برنامه دارای پشتیبانی چند سکویی بوده و با استفاده از روش‌های مدرن توسعه طراحی شده است.

## ویژگی‌ها

- پشتیبانی از چندین سکو (اندروید، iOS، وب، دسکتاپ)
- یکپارچه‌سازی با Supabase برای خدمات بک‌اند
- معماری ماژولار و تمیز
- آسان برای پیکربندی و سفارشی‌سازی

## پیش‌نیازها

برای کار روی این پروژه، اطمینان حاصل کنید که موارد زیر نصب شده باشند:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (نسخه 3.x یا بالاتر)
- [Dart](https://dart.dev/get-dart) (همراه با Flutter نصب می‌شود)
- ویرایشگر کد (مثلاً [Visual Studio Code](https://code.visualstudio.com/) یا [Android Studio](https://developer.android.com/studio))
- حساب کاربری در Supabase (برای تنظیمات بک‌اند)

## شروع به کار

برای اجرای پروژه به صورت محلی مراحل زیر را دنبال کنید:

1. مخزن را کلون کنید:
   ```bash
   git clone <repository-url>
   cd taxi_internet-main
   ```

2. وابستگی‌ها را نصب کنید:
   ```bash
   flutter pub get
   ```

3. برنامه را اجرا کنید:
   - برای اندروید: `flutter run -d android`
   - برای iOS: `flutter run -d ios`
   - برای وب: `flutter run -d web`
   - برای دسکتاپ: `flutter run -d windows` (یا `macos`، `linux`)

## ساختار پروژه

```plaintext
lib/
├── main.dart           # نقطه ورود برنامه
├── screens/            # صفحات رابط کاربری
├── widgets/            # ویجت‌های قابل استفاده مجدد
├── models/             # مدل‌های داده
├── services/           # یکپارچه‌سازی‌های API و بک‌اند
└── utils/              # توابع کمکی و ثابت‌ها
```

## تنظیمات

1. **پیکربندی Supabase:**
   - پیکربندی `supabase` را در پروژه با کلید API و URL خود به‌روزرسانی کنید.

2. **متغیرهای محیطی:**
   - از فایل‌های `.env` یا روش‌های پیکربندی محیط برای کلیدهای حساس استفاده کنید.

## تست

برای اجرای تست‌ها از دستور زیر استفاده کنید:
```bash
flutter test
```

## مشارکت در توسعه

مشارکت شما استقبال می‌شود! برای مشارکت:

1. مخزن را Fork کنید.
2. یک شاخه جدید ایجاد کنید: `git checkout -b feature-name`
3. تغییرات را ثبت کنید: `git commit -m 'Add some feature'`
4. به شاخه ارسال کنید: `git push origin feature-name`
5. یک Pull Request باز کنید.



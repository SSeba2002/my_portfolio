#!/bin/bash

# تثبيت Flutter
git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:$(pwd)/flutter/bin"

# إعداد المشروع
flutter pub get
flutter clean

# بناء المشروع مع تعطيل tree shaking للأيقونات
flutter build web --release --no-tree-shake-icons || {
    echo "Failed to build Flutter project"
    exit 1
}

# إنشاء مجلد public إذا لم يكن موجوداً
mkdir -p public

# نسخ الملفات مع التحقق من وجودها
if [ -d "build/web" ]; then
    cp -r build/web/* public/
else
    echo "Error: build/web directory not found"
    exit 1
fi
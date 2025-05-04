#!/bin/bash

# تثبيت Flutter
git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:$(pwd)/flutter/bin"

# التحقق من التثبيت
flutter --version

# بناء المشروع
flutter pub get
flutter build web --release --no-tree-shake-icons

# نسخ الملفات للمجلد النهائي
cp -r build/web/* public/
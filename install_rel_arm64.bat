@echo off
C:
cd ../../../../../
cd platform-tools
adb devices
adb install C:\Users\shipp\Documents\GitHub\nojo_android\build\app\outputs\flutter-apk\app-arm64-v8a-release.apk
cd ../
cd Users\shipp\Documents\GitHub\nojo_android
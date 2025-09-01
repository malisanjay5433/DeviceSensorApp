@echo off
REM Device Sensor App - APK Build Script for Windows
REM This script builds a debug APK for team testing

echo 🚀 Building Device Sensor App APK...
echo ==================================

REM Check if Flutter is installed
flutter --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Flutter is not installed or not in PATH
    echo Please install Flutter: https://flutter.dev/docs/get-started/install
    pause
    exit /b 1
)

REM Check Flutter doctor
echo 🔍 Checking Flutter setup...
flutter doctor

REM Clean project
echo 🧹 Cleaning project...
flutter clean

REM Get dependencies
echo 📦 Getting dependencies...
flutter pub get

REM Generate code
echo 🔧 Generating code...
flutter packages pub run build_runner build

REM Build APK
echo 🏗️ Building debug APK...
flutter build apk --debug

REM Check if build was successful
if %errorlevel% equ 0 (
    echo ✅ APK built successfully!
    echo 📱 APK location: build\app\outputs\flutter-apk\app-debug.apk
    echo.
    echo 📋 Installation Instructions:
    echo 1. Transfer the APK to your Android device
    echo 2. Enable 'Unknown Sources' in Settings ^> Security
    echo 3. Tap the APK file to install
    echo 4. Grant camera permission when prompted
    echo.
    echo 🧪 Testing Notes:
    echo - Flashlight only works on physical devices
    echo - Simulator shows mock data with special indicators
    echo - Camera permission required for flashlight control
) else (
    echo ❌ APK build failed!
    echo Please check the error messages above and try:
    echo 1. flutter doctor
    echo 2. Check Java version (should be Java 17)
    echo 3. Clean Gradle cache
)

pause

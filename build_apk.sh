#!/bin/bash

# Device Sensor App - APK Build Script
# This script builds a debug APK for team testing

echo "🚀 Building Device Sensor App APK..."
echo "=================================="

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed or not in PATH"
    echo "Please install Flutter: https://flutter.dev/docs/get-started/install"
    exit 1
fi

# Check Flutter doctor
echo "🔍 Checking Flutter setup..."
flutter doctor

# Clean project
echo "🧹 Cleaning project..."
flutter clean

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Generate code
echo "🔧 Generating code..."
flutter packages pub run build_runner build

# Build APK
echo "🏗️ Building debug APK..."
flutter build apk --debug

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✅ APK built successfully!"
    echo "📱 APK location: build/app/outputs/flutter-apk/app-debug.apk"
    echo ""
    echo "📋 Installation Instructions:"
    echo "1. Transfer the APK to your Android device"
    echo "2. Enable 'Unknown Sources' in Settings > Security"
    echo "3. Tap the APK file to install"
    echo "4. Grant camera permission when prompted"
    echo ""
    echo "🧪 Testing Notes:"
    echo "- Flashlight only works on physical devices"
    echo "- Simulator shows mock data with special indicators"
    echo "- Camera permission required for flashlight control"
else
    echo "❌ APK build failed!"
    echo "Please check the error messages above and try:"
    echo "1. flutter doctor"
    echo "2. Check Java version (should be Java 17)"
    echo "3. Clean Gradle cache: rm -rf ~/.gradle/caches"
    exit 1
fi

# 📱 Build Instructions for Device Sensor App

## 🚀 Quick APK Build

To build the debug APK for team testing, follow these steps:

### Prerequisites
- Flutter SDK 3.0.0+
- Java 17 (for Android builds)
- Android SDK with API 34

### Build Commands

1. **Clean the project:**
   ```bash
   flutter clean
   flutter pub get
   ```

2. **Generate required code:**
   ```bash
   flutter packages pub run build_runner build
   ```

3. **Build debug APK:**
   ```bash
   flutter build apk --debug
   ```

4. **Find the APK:**
   The APK will be located at:
   ```
   build/app/outputs/flutter-apk/app-debug.apk
   ```

### Alternative: Build Release APK
```bash
flutter build apk --release
```
Release APK location: `build/app/outputs/flutter-apk/app-release.apk`

## 🔧 Troubleshooting

### Java Version Issues
If you encounter Java compatibility errors:

1. **Check Java version:**
   ```bash
   java -version
   ```

2. **Install Java 17 if needed:**
   ```bash
   # macOS with Homebrew
   brew install openjdk@17
   
   # Set JAVA_HOME
   export JAVA_HOME=/opt/homebrew/opt/openjdk@17
   ```

3. **Clean Gradle cache:**
   ```bash
   rm -rf ~/.gradle/caches
   flutter clean
   ```

### Android SDK Issues
1. **Update Android SDK:**
   - Open Android Studio
   - Go to SDK Manager
   - Install Android SDK 34

2. **Check environment variables:**
   ```bash
   echo $ANDROID_HOME
   echo $ANDROID_SDK_ROOT
   ```

## 📱 Installation

### On Android Device
1. Enable "Unknown Sources" in Settings > Security
2. Transfer the APK to your device
3. Tap the APK file to install
4. Grant camera permission when prompted

### On Android Emulator
1. Start an Android emulator
2. Drag and drop the APK onto the emulator
3. Or use: `adb install app-debug.apk`

## 🧪 Testing Features

### Dashboard Screen
- ✅ Device information display
- ✅ Battery percentage and charging status
- ✅ Simulator detection
- ✅ Pull-to-refresh functionality

### Sensor Info Screen
- ✅ Flashlight control (physical devices only)
- ✅ Real-time status updates
- ✅ Error handling

## 📋 Notes

- **Flashlight**: Only works on physical devices with camera
- **Simulator**: Shows mock data and special indicators
- **Permissions**: Camera permission required for flashlight
- **Platform**: Tested on Android API 21+ and iOS 12.0+

## 🆘 Support

If you encounter build issues:
1. Check Flutter doctor: `flutter doctor`
2. Verify Java version compatibility
3. Clean and rebuild the project
4. Check Android SDK installation

---

**Build Date**: $(date)
**Flutter Version**: $(flutter --version)
**Build Type**: Debug APK

# 📱 Device Sensor App

A Flutter application that demonstrates native platform integration using MethodChannels to fetch device information and control hardware sensors. Built with Clean Architecture principles and Riverpod for state management.

## ✨ Features

### 📊 **Dashboard Screen**
- Real-time device information display (battery percentage, device name, OS version)
- Simulator detection with special indicators and mock data
- Beautiful Lottie animations during loading states
- Pull-to-refresh functionality for real-time updates
- Platform-specific icons and styling

### 🔦 **Sensor Control**
- Native flashlight control using custom MethodChannels
- Real-time flashlight status monitoring
- Smooth toggle animations with visual feedback
- Error handling and user-friendly messages
- Cross-platform native implementation

### 🏗️ **Architecture & State Management**
- **Clean Architecture** with Domain, Data, and Presentation layers
- **Riverpod** for efficient state management and dependency injection
- **MethodChannels** for native platform integration
- **Dio** for HTTP requests with proper error handling
- **GetIt + Injectable** for dependency injection

## 📸 Screenshots
<img width="300" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-01 at 20 49 03" src="https://github.com/user-attachments/assets/b80b5ab1-c717-46b1-9aa7-f8640aff87d3" />
<img width="300" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-01 at 20 49 07" src="https://github.com/user-attachments/assets/06380f98-d137-428d-a1ed-f74614cd2288" />

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (comes with Flutter)
- Android Studio / Xcode
- Java 17 (for Android builds)
- iOS 12.0+ / Android API 21+

### Installation

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd devicesensorapp
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Generate code:**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the application:**
   ```bash
   flutter run
   ```

## 📱 Download APK

### Quick Build Script
Use the provided build script to create a debug APK:

```bash
# Make script executable (first time only)
chmod +x build_apk.sh

# Build APK
./build_apk.sh
```

The APK will be created at: `build/app/outputs/flutter-apk/app-debug.apk`

### Manual Build
```bash
# Clean and build
flutter clean
flutter pub get
flutter packages pub run build_runner build
flutter build apk --debug
```

### Installation
1. Transfer the APK to your Android device
2. Enable "Unknown Sources" in Settings > Security
3. Tap the APK file to install
4. Grant camera permission when prompted

**Note**: Flashlight control only works on physical devices with camera support.

### iOS Setup

If you encounter iOS build issues:

1. **Update deployment target:**
   ```bash
   cd ios
   rm -rf Pods Podfile.lock
   pod install
   cd ..
   ```

2. **Clean and rebuild:**
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

### Android Setup

If you encounter Android build issues:

1. **Clean and rebuild:**
   ```bash
   flutter clean
   flutter pub get
   flutter build apk --debug
   ```

2. **Java version issues:**
   - Ensure Java 17 is installed and configured
   - Check `JAVA_HOME` environment variable

## 📁 Project Structure

```
lib/
├── core/
│   ├── di/                 # Dependency injection setup
│   ├── errors/             # Error handling
│   ├── network/            # Network configuration
│   └── utils/              # Utility functions
├── data/
│   ├── datasources/        # Data sources (API, local)
│   ├── models/             # Data models
│   └── repositories/       # Repository implementations
├── domain/
│   ├── entities/           # Business entities
│   ├── repositories/       # Repository interfaces
│   └── usecases/           # Business logic
└── presentation/
    ├── pages/              # Screen widgets
    ├── providers/          # Riverpod providers
    └── widgets/            # Reusable widgets
```

## 🎯 Key Features Implementation

### Clean Architecture
- **Domain Layer**: Entities, repositories, and use cases
- **Data Layer**: Models, data sources, and repository implementations
- **Presentation Layer**: UI components, pages, and state management

### State Management
- **Riverpod Providers**: Dependency injection and state management
- **AsyncValue**: Proper loading, error, and data states
- **StateNotifier**: Reactive state updates

### Native Integration
- **MethodChannels**: Custom platform channel implementation
- **Android**: Kotlin with Camera2 API for flashlight control
- **iOS**: Swift with AVFoundation for flashlight control

## 🧪 Testing

```bash
# Run tests
flutter test

# Run with coverage
flutter test --coverage
```

## 🛣️ Roadmap

### Completed Features ✅
- [x] Device information display (battery, name, OS version)
- [x] Native flashlight control via MethodChannels
- [x] Clean architecture implementation
- [x] Riverpod state management
- [x] Cross-platform native integration
- [x] Comprehensive unit testing
- [x] Beautiful animations and UI
- [x] Simulator detection and handling

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Riverpod for excellent state management
- The Flutter community for inspiration and support
- Native platform documentation for MethodChannel integration

---

**Made with ❤️ using Flutter and Clean Architecture**

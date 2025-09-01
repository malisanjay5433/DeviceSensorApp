# Device Sensor App

A Flutter application that demonstrates native platform integration using MethodChannels to fetch device information and control hardware sensors.

## 📱 Features

- **Dashboard Screen**: Displays device information (battery percentage, device name, OS version)
- **Sensor Info Screen**: Controls flashlight using native platform channels
- **Clean Architecture**: Domain-driven design with proper separation of concerns
- **State Management**: Riverpod for reactive state management
- **Animations**: Lottie animations and smooth UI transitions
- **Cross-Platform**: Works on both iOS and Android with native performance

## 🏗️ Architecture

This project follows Clean Architecture principles:

```
lib/
├── core/           # Core utilities, errors, and dependency injection
├── data/           # Data sources, models, and repository implementations
├── domain/         # Business logic, entities, and use cases
└── presentation/   # UI components, pages, and state management
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / Xcode
- Java 17 (for Android builds)
- iOS 12.0+ / Android API 21+

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd devicesensorapp
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter packages pub run build_runner build
   ```

### Running the App

#### iOS
```bash
# Run on iOS Simulator
flutter run -d "iPhone 16 Pro"

# Or run on physical iOS device
flutter run -d <device-id>
```

#### Android
```bash
# Run on Android Emulator
flutter run -d <emulator-id>

# Or run on physical Android device
flutter run -d <device-id>
```

### Building the App

#### Debug Build
```bash
# iOS
flutter build ios --debug

# Android
flutter build apk --debug
```

#### Release Build
```bash
# iOS
flutter build ios --release

# Android
flutter build apk --release
```

## 🧪 Testing

Run the test suite:

```bash
# Run all tests
flutter test

# Run specific test files
flutter test test/unit/

# Run with coverage
flutter test --coverage
```

## 📱 Screenshots

### Dashboard Screen
- Device information display
- Battery percentage with charging status
- OS version and device name
- Simulator detection with special indicators
- Lottie loading animations

### Sensor Info Screen
- Flashlight control with native MethodChannel
- Real-time status updates
- Smooth toggle animations
- Error handling and user feedback

## 🔧 Native Integration

### Android (Kotlin)
- **File**: `android/app/src/main/kotlin/com/example/devicesensorapp/MainActivity.kt`
- **Features**: Camera2 API for flashlight control
- **Permissions**: Camera and flashlight access

### iOS (Swift)
- **File**: `ios/Runner/AppDelegate.swift`
- **Features**: AVFoundation for flashlight control
- **Permissions**: Camera usage description

## 📦 Dependencies

### Core Dependencies
- `flutter_riverpod` - State management
- `get_it` + `injectable` - Dependency injection
- `dio` + `retrofit` - HTTP client
- `dartz` - Functional programming (Either type)

### Platform Integration
- `device_info_plus` - Device information
- `battery_plus` - Battery status
- `lottie` - Animations

### Development
- `build_runner` - Code generation
- `riverpod_generator` - Riverpod code generation
- `injectable_generator` - Dependency injection generation

## 🏛️ Project Structure

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

## 🧪 Testing Strategy

### Unit Tests
- **MethodChannel Tests**: Test native platform integration
- **Data Source Tests**: Test data layer components
- **Use Case Tests**: Test business logic
- **Provider Tests**: Test state management

### Test Coverage
- MethodChannel integration
- Business logic validation
- Error handling scenarios
- State management flows

## 🚨 Troubleshooting

### Common Issues

#### Android Build Issues
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter build apk --debug
```

#### iOS Build Issues
```bash
# Clean iOS build
cd ios
rm -rf Pods Podfile.lock
cd ..
flutter clean
flutter pub get
cd ios
pod install
cd ..
flutter run
```

#### Java Version Issues
- Ensure Java 17 is installed and configured
- Check `JAVA_HOME` environment variable
- Update Gradle and Android Gradle Plugin versions

### Platform-Specific Issues

#### Android
- **Camera Permission**: Ensure camera permission is granted
- **Flashlight**: Test on physical device (emulators may not support flashlight)

#### iOS
- **Camera Permission**: Grant camera access when prompted
- **Simulator**: Flashlight control works on physical devices only

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📞 Support

For support and questions:
- Create an issue in the repository
- Check the troubleshooting section
- Review Flutter documentation for platform integration

---

**Built with ❤️ using Flutter and Clean Architecture**
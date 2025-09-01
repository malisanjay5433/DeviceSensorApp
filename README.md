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

### Dashboard Screen
- Device information with battery status and charging indicator
- Simulator detection with special "Development Mode" badge
- Platform-specific icons (Android, iOS, Simulator)
- Beautiful card-based layout with Material Design 3

### Sensor Info Screen
- Flashlight control with native MethodChannel integration
- Real-time status updates with smooth animations
- Error handling with user-friendly messages
- Toggle button with visual feedback

## 🛠️ Technologies Used

- **Flutter** - UI Toolkit for cross-platform development
- **Riverpod** - State management and dependency injection
- **MethodChannels** - Native platform integration
- **Dio** - HTTP client for API requests
- **GetIt + Injectable** - Dependency injection
- **Lottie** - Beautiful animations
- **Dartz** - Functional programming (Either type)

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

### Future Enhancements 🚀
- [ ] Additional sensor support (gyroscope, accelerometer)
- [ ] Device performance monitoring
- [ ] Network connectivity status
- [ ] Storage information display
- [ ] Camera integration
- [ ] Location services

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Riverpod for excellent state management
- The Flutter community for inspiration and support
- Native platform documentation for MethodChannel integration

---

**Made with ❤️ using Flutter and Clean Architecture**
# Clean Architecture with Riverpod

This Flutter project follows Clean Architecture principles with Riverpod for state management.

## Project Structure

```
lib/
├── core/                    # Core layer - shared utilities and configurations
│   ├── constants/          # App constants and configuration
│   ├── di/                 # Dependency injection setup
│   ├── errors/             # Error handling and failure classes
│   ├── network/            # Network connectivity and configuration
│   └── utils/              # Utility functions and type definitions
├── data/                   # Data layer - external data sources
│   ├── datasources/        # Remote and local data sources
│   ├── models/             # Data models with JSON serialization
│   └── repositories/       # Repository implementations
├── domain/                 # Domain layer - business logic
│   ├── entities/           # Core business entities
│   ├── repositories/       # Repository interfaces (contracts)
│   └── usecases/           # Business logic use cases
└── presentation/           # Presentation layer - UI and state management
    ├── pages/              # Screen widgets
    ├── providers/          # Riverpod providers for state management
    └── widgets/            # Reusable UI components
```

## Architecture Layers

### 1. Domain Layer (Business Logic)
- **Entities**: Core business objects (e.g., `DeviceSensor`)
- **Repositories**: Abstract interfaces defining data contracts
- **Use Cases**: Business logic implementations

### 2. Data Layer (Data Sources)
- **Models**: Data transfer objects with JSON serialization
- **Data Sources**: Remote API and local storage implementations
- **Repository Implementations**: Concrete implementations of domain repositories

### 3. Presentation Layer (UI & State)
- **Pages**: Screen widgets
- **Providers**: Riverpod providers for state management
- **Widgets**: Reusable UI components

### 4. Core Layer (Shared)
- **Constants**: App-wide constants and configuration
- **Errors**: Error handling and failure classes
- **Network**: Network connectivity utilities
- **DI**: Dependency injection configuration

## Key Technologies

- **State Management**: Riverpod with code generation
- **Dependency Injection**: GetIt with Injectable
- **API Calls**: Dio with Retrofit
- **JSON Serialization**: json_annotation with code generation
- **Error Handling**: Either pattern with Dartz
- **Code Generation**: build_runner for automated code generation

## Getting Started

1. Install dependencies:
   ```bash
   flutter packages get
   ```

2. Generate code:
   ```bash
   flutter packages pub run build_runner build
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Code Generation

The project uses several code generation tools:

- **Riverpod**: `@riverpod` annotations for providers
- **Injectable**: `@injectable` annotations for dependency injection
- **JSON Serializable**: `@JsonSerializable` for model serialization
- **Retrofit**: `@RestApi` for API client generation

Run `flutter packages pub run build_runner build` after making changes to annotated classes.

## Dependencies

### Main Dependencies
- `flutter_riverpod`: State management
- `get_it`: Dependency injection container
- `injectable`: Dependency injection annotations
- `dio`: HTTP client
- `retrofit`: API client generator
- `json_annotation`: JSON serialization
- `equatable`: Value equality
- `dartz`: Functional programming (Either type)

### Dev Dependencies
- `build_runner`: Code generation runner
- `riverpod_generator`: Riverpod code generation
- `injectable_generator`: Injectable code generation
- `retrofit_generator`: Retrofit code generation
- `json_serializable`: JSON serialization generator

## Best Practices

1. **Separation of Concerns**: Each layer has a specific responsibility
2. **Dependency Inversion**: Dependencies point inward toward the domain
3. **Testability**: Each layer can be tested independently
4. **Code Generation**: Use annotations to reduce boilerplate
5. **Error Handling**: Use Either pattern for consistent error handling
6. **State Management**: Use Riverpod providers for reactive state management

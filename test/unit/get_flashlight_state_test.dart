import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:devicesensorapp/domain/entities/sensor_data.dart';
import 'package:devicesensorapp/domain/repositories/sensor_repository.dart';
import 'package:devicesensorapp/domain/usecases/get_flashlight_state.dart';
import 'package:devicesensorapp/core/errors/failures.dart';

class MockSensorRepository implements SensorRepository {
  @override
  Future<Either<Failure, FlashlightState>> getFlashlightState() async {
    return const Right(FlashlightState(
      isOn: false,
      isAvailable: true,
    ));
  }

  @override
  Future<Either<Failure, void>> toggleFlashlight() async {
    return const Right(null);
  }
}

class MockSensorRepositoryWithError implements SensorRepository {
  @override
  Future<Either<Failure, FlashlightState>> getFlashlightState() async {
    return const Left(ServerFailure(message: 'Flashlight not available'));
  }

  @override
  Future<Either<Failure, void>> toggleFlashlight() async {
    return const Left(ServerFailure(message: 'Failed to toggle flashlight'));
  }
}

void main() {
  group('GetFlashlightState', () {
    late GetFlashlightState useCase;
    late MockSensorRepository mockRepository;

    setUp(() {
      mockRepository = MockSensorRepository();
      useCase = GetFlashlightState(mockRepository);
    });

    test('should return FlashlightState when repository call is successful', () async {
      // Act
      final result = await useCase();

      // Assert
      expect(result, isA<Right<Failure, FlashlightState>>());
      result.fold(
        (failure) => fail('Should not return failure'),
        (flashlightState) {
          expect(flashlightState.isAvailable, true);
          expect(flashlightState.isOn, false);
        },
      );
    });

    test('should return failure when repository call fails', () async {
      // Arrange
      final errorRepository = MockSensorRepositoryWithError();
      final errorUseCase = GetFlashlightState(errorRepository);

      // Act
      final result = await errorUseCase();

      // Assert
      expect(result, isA<Left<Failure, FlashlightState>>());
      result.fold(
        (failure) {
          expect(failure, isA<ServerFailure>());
          expect((failure as ServerFailure).message, 'Flashlight not available');
        },
        (flashlightState) => fail('Should not return success'),
      );
    });
  });

  group('ToggleFlashlight', () {
    late ToggleFlashlight useCase;
    late MockSensorRepository mockRepository;

    setUp(() {
      mockRepository = MockSensorRepository();
      useCase = ToggleFlashlight(mockRepository);
    });

    test('should return void when repository call is successful', () async {
      // Act
      final result = await useCase();

      // Assert
      expect(result, isA<Right<Failure, void>>());
      result.fold(
        (failure) => fail('Should not return failure'),
        (void result) => expect(result, isNull),
      );
    });

    test('should return failure when repository call fails', () async {
      // Arrange
      final errorRepository = MockSensorRepositoryWithError();
      final errorUseCase = ToggleFlashlight(errorRepository);

      // Act
      final result = await errorUseCase();

      // Assert
      expect(result, isA<Left<Failure, void>>());
      result.fold(
        (failure) {
          expect(failure, isA<ServerFailure>());
          expect((failure as ServerFailure).message, 'Failed to toggle flashlight');
        },
        (void result) => fail('Should not return success'),
      );
    });
  });
}

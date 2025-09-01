import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:devicesensorapp/data/datasources/sensor_datasource.dart';
import 'package:devicesensorapp/domain/entities/sensor_data.dart';

void main() {
  group('SensorDataSourceImpl', () {
    late SensorDataSourceImpl dataSource;
    const MethodChannel channel = MethodChannel('flashlight_channel');

    setUp(() {
      dataSource = SensorDataSourceImpl();
    });

    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
    });

    test('getFlashlightState should return FlashlightState from MethodChannel', () async {
      // Arrange
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        return {
          'isAvailable': true,
          'isOn': true,
        };
      });

      // Act
      final result = await dataSource.getFlashlightState();

      // Assert
      expect(result, isA<FlashlightState>());
      expect(result.isAvailable, true);
      expect(result.isOn, true);
    });

    test('toggleFlashlight should call MethodChannel toggleFlashlight', () async {
      // Arrange
      bool methodCalled = false;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        if (methodCall.method == 'toggleFlashlight') {
          methodCalled = true;
        }
        return null;
      });

      // Act
      await dataSource.toggleFlashlight();

      // Assert
      expect(methodCalled, true);
    });

    test('getFlashlightState should handle MethodChannel errors', () async {
      // Arrange
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        throw PlatformException(
          code: 'FLASHLIGHT_ERROR',
          message: 'Flashlight not available',
        );
      });

      // Act
      final result = await dataSource.getFlashlightState();

      // Assert
      expect(result.isAvailable, false);
      expect(result.isOn, false);
    });

    test('toggleFlashlight should propagate MethodChannel errors', () async {
      // Arrange
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        throw PlatformException(
          code: 'FLASHLIGHT_ERROR',
          message: 'Failed to toggle flashlight',
        );
      });

      // Act & Assert
      expect(
        () => dataSource.toggleFlashlight(),
        throwsA(isA<Exception>()),
      );
    });
  });
}

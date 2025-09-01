import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:devicesensorapp/data/datasources/flashlight_method_channel.dart';
import 'package:devicesensorapp/domain/entities/sensor_data.dart';

void main() {
  group('FlashlightMethodChannel', () {
    const MethodChannel channel = MethodChannel('flashlight_channel');

    setUp(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        switch (methodCall.method) {
          case 'getFlashlightState':
            return {
              'isAvailable': true,
              'isOn': false,
            };
          case 'toggleFlashlight':
            return null;
          case 'enableFlashlight':
            return null;
          case 'disableFlashlight':
            return null;
          default:
            throw PlatformException(
              code: 'UNIMPLEMENTED',
              message: 'Method not implemented',
            );
        }
      });
    });

    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
    });

    test('getFlashlightState should return FlashlightState with correct values', () async {
      // Act
      final result = await FlashlightMethodChannel.getFlashlightState();

      // Assert
      expect(result, isA<FlashlightState>());
      expect(result.isAvailable, true);
      expect(result.isOn, false);
    });

    test('toggleFlashlight should complete without error', () async {
      // Act & Assert
      expect(() => FlashlightMethodChannel.toggleFlashlight(), returnsNormally);
    });

    test('enableFlashlight should complete without error', () async {
      // Act & Assert
      expect(() => FlashlightMethodChannel.enableFlashlight(), returnsNormally);
    });

    test('disableFlashlight should complete without error', () async {
      // Act & Assert
      expect(() => FlashlightMethodChannel.disableFlashlight(), returnsNormally);
    });

    test('getFlashlightState should handle errors gracefully', () async {
      // Arrange
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        throw PlatformException(
          code: 'FLASHLIGHT_ERROR',
          message: 'Flashlight not available',
        );
      });

      // Act
      final result = await FlashlightMethodChannel.getFlashlightState();

      // Assert
      expect(result.isAvailable, false);
      expect(result.isOn, false);
    });

    test('toggleFlashlight should throw exception on error', () async {
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
        () => FlashlightMethodChannel.toggleFlashlight(),
        throwsA(isA<Exception>()),
      );
    });
  });
}

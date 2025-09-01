import 'package:flutter/services.dart';
import 'package:devicesensorapp/domain/entities/sensor_data.dart';

class FlashlightMethodChannel {
  static const MethodChannel _channel = MethodChannel('flashlight_channel');

  static Future<FlashlightState> getFlashlightState() async {
    try {
      final result = await _channel.invokeMethod('getFlashlightState');
      return FlashlightState(
        isOn: result['isOn'] ?? false,
        isAvailable: result['isAvailable'] ?? false,
      );
    } catch (e) {
      return const FlashlightState(
        isOn: false,
        isAvailable: false,
      );
    }
  }

  static Future<void> toggleFlashlight() async {
    try {
      await _channel.invokeMethod('toggleFlashlight');
    } catch (e) {
      throw Exception('Failed to toggle flashlight: $e');
    }
  }

  static Future<void> enableFlashlight() async {
    try {
      await _channel.invokeMethod('enableFlashlight');
    } catch (e) {
      throw Exception('Failed to enable flashlight: $e');
    }
  }

  static Future<void> disableFlashlight() async {
    try {
      await _channel.invokeMethod('disableFlashlight');
    } catch (e) {
      throw Exception('Failed to disable flashlight: $e');
    }
  }
}

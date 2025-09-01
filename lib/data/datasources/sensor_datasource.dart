import 'package:torch_light/torch_light.dart';
import 'package:devicesensorapp/domain/entities/sensor_data.dart';

abstract class SensorDataSource {
  Future<FlashlightState> getFlashlightState();
  Future<void> toggleFlashlight();
}

class SensorDataSourceImpl implements SensorDataSource {
  @override
  Future<FlashlightState> getFlashlightState() async {
    try {
      final isAvailable = await TorchLight.isTorchAvailable();
      // For torch_light, we'll assume it's off initially and track state manually
      return FlashlightState(
        isOn: false, // We'll track this state in the provider
        isAvailable: isAvailable,
      );
    } catch (e) {
      return const FlashlightState(
        isOn: false,
        isAvailable: false,
      );
    }
  }

  @override
  Future<void> toggleFlashlight() async {
    try {
      // Use enable/disable methods for torch_light
      await TorchLight.enableTorch();
    } catch (e) {
      throw Exception('Failed to toggle flashlight: $e');
    }
  }
}

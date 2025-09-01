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
      final isOn = await TorchLight.isTorchOn();
      return FlashlightState(
        isOn: isOn,
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
      final isOn = await TorchLight.isTorchOn();
      if (isOn) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }
    } catch (e) {
      throw Exception('Failed to toggle flashlight: $e');
    }
  }
}

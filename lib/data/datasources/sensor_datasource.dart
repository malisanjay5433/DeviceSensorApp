import 'package:devicesensorapp/domain/entities/sensor_data.dart';
import 'package:devicesensorapp/data/datasources/flashlight_method_channel.dart';

abstract class SensorDataSource {
  Future<FlashlightState> getFlashlightState();
  Future<void> toggleFlashlight();
}

class SensorDataSourceImpl implements SensorDataSource {
  @override
  Future<FlashlightState> getFlashlightState() async {
    return await FlashlightMethodChannel.getFlashlightState();
  }

  @override
  Future<void> toggleFlashlight() async {
    await FlashlightMethodChannel.toggleFlashlight();
  }
}

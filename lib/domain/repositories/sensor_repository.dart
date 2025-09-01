import 'package:devicesensorapp/core/utils/typedefs.dart';
import 'package:devicesensorapp/domain/entities/sensor_data.dart';

abstract class SensorRepository {
  ResultFuture<FlashlightState> getFlashlightState();
  ResultFuture<void> toggleFlashlight();
}

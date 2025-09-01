import 'package:devicesensorapp/core/utils/typedefs.dart';
import 'package:devicesensorapp/domain/entities/sensor_data.dart';
import 'package:devicesensorapp/domain/repositories/sensor_repository.dart';

class GetFlashlightState {
  final SensorRepository repository;

  GetFlashlightState(this.repository);

  ResultFuture<FlashlightState> call() async {
    return await repository.getFlashlightState();
  }
}

class ToggleFlashlight {
  final SensorRepository repository;

  ToggleFlashlight(this.repository);

  ResultFuture<void> call() async {
    return await repository.toggleFlashlight();
  }
}

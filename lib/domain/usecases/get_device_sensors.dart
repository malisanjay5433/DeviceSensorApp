import 'package:devicesensorapp/core/utils/typedefs.dart';
import 'package:devicesensorapp/domain/entities/device_sensor.dart';
import 'package:devicesensorapp/domain/repositories/device_sensor_repository.dart';

class GetDeviceSensors {
  final DeviceSensorRepository repository;

  GetDeviceSensors(this.repository);

  Future<ResultFuture<List<DeviceSensor>>> call() async {
    return await repository.getDeviceSensors();
  }
}

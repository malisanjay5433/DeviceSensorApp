import 'package:devicesensorapp/core/utils/typedefs.dart';
import 'package:devicesensorapp/domain/entities/device_sensor.dart';

abstract class DeviceSensorRepository {
  Future<ResultFuture<List<DeviceSensor>>> getDeviceSensors();
  Future<ResultFuture<DeviceSensor>> getDeviceSensorById(String id);
  Future<ResultFuture<DeviceSensor>> updateDeviceSensor(DeviceSensor sensor);
  Future<ResultFuture<void>> deleteDeviceSensor(String id);
  Future<ResultFuture<DeviceSensor>> createDeviceSensor(DeviceSensor sensor);
}

import 'package:devicesensorapp/core/utils/typedefs.dart';
import 'package:devicesensorapp/domain/entities/device_sensor.dart';

abstract class DeviceSensorRepository {
  ResultFuture<List<DeviceSensor>> getDeviceSensors();
  ResultFuture<DeviceSensor> getDeviceSensorById(String id);
  ResultFuture<DeviceSensor> updateDeviceSensor(DeviceSensor sensor);
  ResultFuture<void> deleteDeviceSensor(String id);
  ResultFuture<DeviceSensor> createDeviceSensor(DeviceSensor sensor);
}

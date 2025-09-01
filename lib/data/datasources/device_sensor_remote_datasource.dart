import 'package:devicesensorapp/data/models/device_sensor_model.dart';

abstract class DeviceSensorRemoteDataSource {
  Future<List<DeviceSensorModel>> getDeviceSensors();
  Future<DeviceSensorModel> getDeviceSensorById(String id);
  Future<DeviceSensorModel> updateDeviceSensor(DeviceSensorModel sensor);
  Future<void> deleteDeviceSensor(String id);
  Future<DeviceSensorModel> createDeviceSensor(DeviceSensorModel sensor);
}

class DeviceSensorRemoteDataSourceImpl implements DeviceSensorRemoteDataSource {
  // TODO: Implement with actual API calls using Dio/Retrofit
  
  @override
  Future<List<DeviceSensorModel>> getDeviceSensors() async {
    // TODO: Implement API call
    throw UnimplementedError();
  }

  @override
  Future<DeviceSensorModel> getDeviceSensorById(String id) async {
    // TODO: Implement API call
    throw UnimplementedError();
  }

  @override
  Future<DeviceSensorModel> updateDeviceSensor(DeviceSensorModel sensor) async {
    // TODO: Implement API call
    throw UnimplementedError();
  }

  @override
  Future<void> deleteDeviceSensor(String id) async {
    // TODO: Implement API call
    throw UnimplementedError();
  }

  @override
  Future<DeviceSensorModel> createDeviceSensor(DeviceSensorModel sensor) async {
    // TODO: Implement API call
    throw UnimplementedError();
  }
}

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:devicesensorapp/core/network/network_info.dart';
import 'package:devicesensorapp/data/datasources/device_sensor_remote_datasource.dart';
import 'package:devicesensorapp/data/datasources/device_info_datasource.dart';
import 'package:devicesensorapp/data/repositories/device_sensor_repository_impl.dart';
import 'package:devicesensorapp/data/repositories/device_info_repository_impl.dart';
import 'package:devicesensorapp/domain/repositories/device_sensor_repository.dart';
import 'package:devicesensorapp/domain/repositories/device_info_repository.dart';
import 'package:devicesensorapp/domain/usecases/get_device_sensors.dart';
import 'package:devicesensorapp/domain/usecases/get_device_info.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  NetworkInfo get networkInfo => NetworkInfoImpl();

  @lazySingleton
  DeviceSensorRemoteDataSource get deviceSensorRemoteDataSource =>
      DeviceSensorRemoteDataSourceImpl();

  @lazySingleton
  DeviceSensorRepository get deviceSensorRepository => DeviceSensorRepositoryImpl(
        remoteDataSource: getIt<DeviceSensorRemoteDataSource>(),
        networkInfo: getIt<NetworkInfo>(),
      );

  @lazySingleton
  GetDeviceSensors get getDeviceSensors => GetDeviceSensors(
        getIt<DeviceSensorRepository>(),
      );

  @lazySingleton
  DeviceInfoDataSource get deviceInfoDataSource => DeviceInfoDataSourceImpl();

  @lazySingleton
  DeviceInfoRepository get deviceInfoRepository => DeviceInfoRepositoryImpl(
        dataSource: getIt<DeviceInfoDataSource>(),
      );

  @lazySingleton
  GetDeviceInfo get getDeviceInfo => GetDeviceInfo(
        getIt<DeviceInfoRepository>(),
      );
}

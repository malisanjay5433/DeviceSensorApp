// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:devicesensorapp/core/di/injection.dart' as _i11;
import 'package:devicesensorapp/core/network/network_info.dart' as _i10;
import 'package:devicesensorapp/data/datasources/device_info_datasource.dart'
    as _i3;
import 'package:devicesensorapp/data/datasources/device_sensor_remote_datasource.dart'
    as _i5;
import 'package:devicesensorapp/domain/repositories/device_info_repository.dart'
    as _i4;
import 'package:devicesensorapp/domain/repositories/device_sensor_repository.dart'
    as _i6;
import 'package:devicesensorapp/domain/usecases/get_device_info.dart' as _i8;
import 'package:devicesensorapp/domain/usecases/get_device_sensors.dart' as _i9;
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.DeviceInfoDataSource>(
        () => registerModule.deviceInfoDataSource);
    gh.lazySingleton<_i4.DeviceInfoRepository>(
        () => registerModule.deviceInfoRepository);
    gh.lazySingleton<_i5.DeviceSensorRemoteDataSource>(
        () => registerModule.deviceSensorRemoteDataSource);
    gh.lazySingleton<_i6.DeviceSensorRepository>(
        () => registerModule.deviceSensorRepository);
    gh.lazySingleton<_i7.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i8.GetDeviceInfo>(() => registerModule.getDeviceInfo);
    gh.lazySingleton<_i9.GetDeviceSensors>(
        () => registerModule.getDeviceSensors);
    gh.lazySingleton<_i10.NetworkInfo>(() => registerModule.networkInfo);
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}

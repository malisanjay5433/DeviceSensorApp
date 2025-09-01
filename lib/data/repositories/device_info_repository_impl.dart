import 'package:devicesensorapp/core/errors/failures.dart';
import 'package:devicesensorapp/core/utils/typedefs.dart';
import 'package:devicesensorapp/data/datasources/device_info_datasource.dart';
import 'package:devicesensorapp/domain/entities/device_info.dart';
import 'package:devicesensorapp/domain/repositories/device_info_repository.dart';
import 'package:dartz/dartz.dart';

class DeviceInfoRepositoryImpl implements DeviceInfoRepository {
  final DeviceInfoDataSource dataSource;

  DeviceInfoRepositoryImpl({
    required this.dataSource,
  });

  @override
  ResultFuture<DeviceInfo> getDeviceInfo() async {
    try {
      final deviceInfo = await dataSource.getDeviceInfo();
      return Right(deviceInfo);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

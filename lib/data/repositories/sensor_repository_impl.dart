import 'package:devicesensorapp/core/errors/failures.dart';
import 'package:devicesensorapp/core/utils/typedefs.dart';
import 'package:devicesensorapp/data/datasources/sensor_datasource.dart';
import 'package:devicesensorapp/domain/entities/sensor_data.dart';
import 'package:devicesensorapp/domain/repositories/sensor_repository.dart';
import 'package:dartz/dartz.dart';

class SensorRepositoryImpl implements SensorRepository {
  final SensorDataSource dataSource;

  SensorRepositoryImpl({
    required this.dataSource,
  });

  @override
  ResultFuture<FlashlightState> getFlashlightState() async {
    try {
      final flashlightState = await dataSource.getFlashlightState();
      return Right(flashlightState);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<void> toggleFlashlight() async {
    try {
      await dataSource.toggleFlashlight();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

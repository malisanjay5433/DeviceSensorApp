import 'package:devicesensorapp/core/errors/failures.dart';
import 'package:devicesensorapp/core/network/network_info.dart';
import 'package:devicesensorapp/core/utils/typedefs.dart';
import 'package:devicesensorapp/data/datasources/device_sensor_remote_datasource.dart';
import 'package:devicesensorapp/domain/entities/device_sensor.dart';
import 'package:devicesensorapp/domain/repositories/device_sensor_repository.dart';
import 'package:dartz/dartz.dart';

class DeviceSensorRepositoryImpl implements DeviceSensorRepository {
  final DeviceSensorRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  DeviceSensorRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<ResultFuture<List<DeviceSensor>>> getDeviceSensors() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteSensors = await remoteDataSource.getDeviceSensors();
        return Right(remoteSensors);
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<ResultFuture<DeviceSensor>> getDeviceSensorById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteSensor = await remoteDataSource.getDeviceSensorById(id);
        return Right(remoteSensor);
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<ResultFuture<DeviceSensor>> updateDeviceSensor(DeviceSensor sensor) async {
    if (await networkInfo.isConnected) {
      try {
        final sensorModel = DeviceSensorModel.fromEntity(sensor);
        final updatedSensor = await remoteDataSource.updateDeviceSensor(sensorModel);
        return Right(updatedSensor);
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<ResultFuture<void>> deleteDeviceSensor(String id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteDeviceSensor(id);
        return const Right(null);
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<ResultFuture<DeviceSensor>> createDeviceSensor(DeviceSensor sensor) async {
    if (await networkInfo.isConnected) {
      try {
        final sensorModel = DeviceSensorModel.fromEntity(sensor);
        final createdSensor = await remoteDataSource.createDeviceSensor(sensorModel);
        return Right(createdSensor);
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }
}

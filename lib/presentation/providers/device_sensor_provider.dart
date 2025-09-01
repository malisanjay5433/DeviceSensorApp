import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:devicesensorapp/domain/entities/device_sensor.dart';
import 'package:devicesensorapp/domain/usecases/get_device_sensors.dart';
import 'package:devicesensorapp/core/di/injection.dart';

part 'device_sensor_provider.g.dart';

@riverpod
class DeviceSensorNotifier extends _$DeviceSensorNotifier {
  @override
  Future<List<DeviceSensor>> build() async {
    final getDeviceSensors = getIt<GetDeviceSensors>();
    final result = await getDeviceSensors();
    
    return result.fold(
      (failure) => throw Exception(failure.toString()),
      (sensors) => sensors,
    );
  }

  Future<void> refreshSensors() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final getDeviceSensors = getIt<GetDeviceSensors>();
      final result = await getDeviceSensors();
      
      return result.fold(
        (failure) => throw Exception(failure.toString()),
        (sensors) => sensors,
      );
    });
  }
}

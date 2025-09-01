import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:devicesensorapp/domain/entities/device_info.dart';
import 'package:devicesensorapp/domain/usecases/get_device_info.dart';
import 'package:devicesensorapp/core/di/injection.dart';

part 'device_info_provider.g.dart';

@riverpod
class DeviceInfoNotifier extends _$DeviceInfoNotifier {
  @override
  Future<DeviceInfo> build() async {
    final getDeviceInfo = getIt<GetDeviceInfo>();
    final result = await getDeviceInfo();
    
    return result.fold(
      (failure) => throw Exception(failure.toString()),
      (deviceInfo) => deviceInfo,
    );
  }

  Future<void> refreshDeviceInfo() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final getDeviceInfo = getIt<GetDeviceInfo>();
      final result = await getDeviceInfo();
      
      return result.fold(
        (failure) => throw Exception(failure.toString()),
        (deviceInfo) => deviceInfo,
      );
    });
  }
}

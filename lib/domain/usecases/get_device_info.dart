import 'package:devicesensorapp/core/utils/typedefs.dart';
import 'package:devicesensorapp/domain/entities/device_info.dart';
import 'package:devicesensorapp/domain/repositories/device_info_repository.dart';

class GetDeviceInfo {
  final DeviceInfoRepository repository;

  GetDeviceInfo(this.repository);

  ResultFuture<DeviceInfo> call() async {
    return await repository.getDeviceInfo();
  }
}

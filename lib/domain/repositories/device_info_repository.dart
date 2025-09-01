import 'package:devicesensorapp/core/utils/typedefs.dart';
import 'package:devicesensorapp/domain/entities/device_info.dart';

abstract class DeviceInfoRepository {
  ResultFuture<DeviceInfo> getDeviceInfo();
}

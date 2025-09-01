import 'package:devicesensorapp/domain/entities/device_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_info_model.g.dart';

@JsonSerializable()
class DeviceInfoModel extends DeviceInfo {
  const DeviceInfoModel({
    required super.deviceName,
    required super.osVersion,
    required super.batteryLevel,
    required super.isCharging,
    required super.platform,
  });

  factory DeviceInfoModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceInfoModelToJson(this);

  factory DeviceInfoModel.fromEntity(DeviceInfo entity) {
    return DeviceInfoModel(
      deviceName: entity.deviceName,
      osVersion: entity.osVersion,
      batteryLevel: entity.batteryLevel,
      isCharging: entity.isCharging,
      platform: entity.platform,
    );
  }
}

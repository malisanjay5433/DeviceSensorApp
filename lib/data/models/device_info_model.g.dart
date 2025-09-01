// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceInfoModel _$DeviceInfoModelFromJson(Map<String, dynamic> json) =>
    DeviceInfoModel(
      deviceName: json['deviceName'] as String,
      osVersion: json['osVersion'] as String,
      batteryLevel: (json['batteryLevel'] as num).toInt(),
      isCharging: json['isCharging'] as bool,
      platform: json['platform'] as String,
    );

Map<String, dynamic> _$DeviceInfoModelToJson(DeviceInfoModel instance) =>
    <String, dynamic>{
      'deviceName': instance.deviceName,
      'osVersion': instance.osVersion,
      'batteryLevel': instance.batteryLevel,
      'isCharging': instance.isCharging,
      'platform': instance.platform,
    };

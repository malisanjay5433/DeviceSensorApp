// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_sensor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceSensorModel _$DeviceSensorModelFromJson(Map<String, dynamic> json) =>
    DeviceSensorModel(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$DeviceSensorModelToJson(DeviceSensorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'value': instance.value,
      'unit': instance.unit,
      'timestamp': instance.timestamp.toIso8601String(),
      'isActive': instance.isActive,
    };

import 'package:devicesensorapp/domain/entities/device_sensor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_sensor_model.g.dart';

@JsonSerializable()
class DeviceSensorModel extends DeviceSensor {
  const DeviceSensorModel({
    required super.id,
    required super.name,
    required super.type,
    required super.value,
    required super.unit,
    required super.timestamp,
    required super.isActive,
  });

  factory DeviceSensorModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceSensorModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceSensorModelToJson(this);

  factory DeviceSensorModel.fromEntity(DeviceSensor entity) {
    return DeviceSensorModel(
      id: entity.id,
      name: entity.name,
      type: entity.type,
      value: entity.value,
      unit: entity.unit,
      timestamp: entity.timestamp,
      isActive: entity.isActive,
    );
  }
}

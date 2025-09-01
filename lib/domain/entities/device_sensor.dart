import 'package:equatable/equatable.dart';

class DeviceSensor extends Equatable {
  final String id;
  final String name;
  final String type;
  final double value;
  final String unit;
  final DateTime timestamp;
  final bool isActive;

  const DeviceSensor({
    required this.id,
    required this.name,
    required this.type,
    required this.value,
    required this.unit,
    required this.timestamp,
    required this.isActive,
  });

  @override
  List<Object> get props => [
        id,
        name,
        type,
        value,
        unit,
        timestamp,
        isActive,
      ];

  DeviceSensor copyWith({
    String? id,
    String? name,
    String? type,
    double? value,
    String? unit,
    DateTime? timestamp,
    bool? isActive,
  }) {
    return DeviceSensor(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      value: value ?? this.value,
      unit: unit ?? this.unit,
      timestamp: timestamp ?? this.timestamp,
      isActive: isActive ?? this.isActive,
    );
  }
}

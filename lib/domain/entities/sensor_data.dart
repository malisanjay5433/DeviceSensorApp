import 'package:equatable/equatable.dart';

class SensorData extends Equatable {
  final double x;
  final double y;
  final double z;
  final DateTime timestamp;

  const SensorData({
    required this.x,
    required this.y,
    required this.z,
    required this.timestamp,
  });

  @override
  List<Object> get props => [x, y, z, timestamp];

  SensorData copyWith({
    double? x,
    double? y,
    double? z,
    DateTime? timestamp,
  }) {
    return SensorData(
      x: x ?? this.x,
      y: y ?? this.y,
      z: z ?? this.z,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

class FlashlightState extends Equatable {
  final bool isOn;
  final bool isAvailable;

  const FlashlightState({
    required this.isOn,
    required this.isAvailable,
  });

  @override
  List<Object> get props => [isOn, isAvailable];

  FlashlightState copyWith({
    bool? isOn,
    bool? isAvailable,
  }) {
    return FlashlightState(
      isOn: isOn ?? this.isOn,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}

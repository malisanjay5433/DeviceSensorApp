import 'package:equatable/equatable.dart';

class DeviceInfo extends Equatable {
  final String deviceName;
  final String osVersion;
  final int batteryLevel;
  final bool isCharging;
  final String platform;

  const DeviceInfo({
    required this.deviceName,
    required this.osVersion,
    required this.batteryLevel,
    required this.isCharging,
    required this.platform,
  });

  @override
  List<Object> get props => [
        deviceName,
        osVersion,
        batteryLevel,
        isCharging,
        platform,
      ];

  DeviceInfo copyWith({
    String? deviceName,
    String? osVersion,
    int? batteryLevel,
    bool? isCharging,
    String? platform,
  }) {
    return DeviceInfo(
      deviceName: deviceName ?? this.deviceName,
      osVersion: osVersion ?? this.osVersion,
      batteryLevel: batteryLevel ?? this.batteryLevel,
      isCharging: isCharging ?? this.isCharging,
      platform: platform ?? this.platform,
    );
  }
}

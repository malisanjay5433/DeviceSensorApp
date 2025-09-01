import 'package:device_info_plus/device_info_plus.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:devicesensorapp/domain/entities/device_info.dart';
import 'dart:io';

abstract class DeviceInfoDataSource {
  Future<DeviceInfo> getDeviceInfo();
}

class DeviceInfoDataSourceImpl implements DeviceInfoDataSource {
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  final Battery _battery = Battery();

  @override
  Future<DeviceInfo> getDeviceInfo() async {
    try {
      // Get device information
      String deviceName;
      String osVersion;
      String platform;
      bool isSimulator = false;

      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfoPlugin.androidInfo;
        deviceName = androidInfo.model;
        osVersion = 'Android ${androidInfo.version.release}';
        
        // Check if running on emulator
        isSimulator = androidInfo.isPhysicalDevice == false;
        if (isSimulator) {
          deviceName = 'Android Emulator (${androidInfo.model})';
          platform = 'Android Simulator';
        } else {
          platform = 'Android Device';
        }
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfoPlugin.iosInfo;
        deviceName = iosInfo.name;
        osVersion = 'iOS ${iosInfo.systemVersion}';
        
        // Check if running on simulator
        isSimulator = iosInfo.isPhysicalDevice == false;
        if (isSimulator) {
          deviceName = 'iOS Simulator (${iosInfo.name})';
          platform = 'iOS Simulator';
        } else {
          platform = 'iOS Device';
        }
      } else if (Platform.isMacOS) {
        final macInfo = await _deviceInfoPlugin.macOsInfo;
        deviceName = macInfo.computerName;
        osVersion = 'macOS ${macInfo.osRelease}';
        platform = 'macOS';
      } else if (Platform.isWindows) {
        final windowsInfo = await _deviceInfoPlugin.windowsInfo;
        deviceName = windowsInfo.computerName;
        osVersion = 'Windows ${windowsInfo.displayVersion}';
        platform = 'Windows';
      } else if (Platform.isLinux) {
        final linuxInfo = await _deviceInfoPlugin.linuxInfo;
        deviceName = linuxInfo.name;
        osVersion = 'Linux ${linuxInfo.version}';
        platform = 'Linux';
      } else {
        deviceName = 'Unknown Device';
        osVersion = 'Unknown OS';
        platform = 'Unknown';
      }

      // Get battery information
      int batteryLevel;
      bool isCharging;
      
      try {
        batteryLevel = await _battery.batteryLevel;
        final batteryState = await _battery.batteryState;
        isCharging = batteryState == BatteryState.charging;
        
        // For simulators, show a mock battery level
        if (isSimulator) {
          batteryLevel = 85; // Mock battery level for simulator
          isCharging = false;
        }
      } catch (e) {
        // Fallback for battery info
        batteryLevel = isSimulator ? 85 : 0;
        isCharging = false;
      }

      return DeviceInfo(
        deviceName: deviceName,
        osVersion: osVersion,
        batteryLevel: batteryLevel,
        isCharging: isCharging,
        platform: platform,
      );
    } catch (e) {
      // Return default values if there's an error
      return const DeviceInfo(
        deviceName: 'Unknown Device',
        osVersion: 'Unknown OS',
        batteryLevel: 0,
        isCharging: false,
        platform: 'Unknown',
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:devicesensorapp/presentation/providers/device_info_provider.dart';
import 'package:devicesensorapp/presentation/widgets/device_info_card.dart';
import 'package:devicesensorapp/presentation/widgets/loading_widget.dart';
import 'package:devicesensorapp/presentation/widgets/error_widget.dart' as custom;
import 'package:devicesensorapp/presentation/pages/sensor_info_page.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceInfoAsync = ref.watch(deviceInfoNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.sensors),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SensorInfoPage(),
                ),
              );
            },
            tooltip: 'Sensor Info',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(deviceInfoNotifierProvider.notifier).refreshDeviceInfo(),
          ),
        ],
      ),
      body: deviceInfoAsync.when(
        data: (deviceInfo) => RefreshIndicator(
          onRefresh: () => ref.read(deviceInfoNotifierProvider.notifier).refreshDeviceInfo(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Section with Animation
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor.withOpacity(0.1),
                        Theme.of(context).primaryColor.withOpacity(0.05),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      // Lottie Animation
                      SizedBox(
                        height: 120,
                        child: Lottie.asset(
                          'assets/animations/welcome.json',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            // Fallback to a simple animated icon if Lottie file is not found
                            return const Icon(
                              Icons.dashboard,
                              size: 80,
                              color: Colors.blue,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Welcome to Device Dashboard',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Monitor your device information in real-time',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      // Development Mode Indicator
                      if (deviceInfo.deviceName.toLowerCase().contains('simulator') || 
                          deviceInfo.deviceName.toLowerCase().contains('emulator'))
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.orange.withOpacity(0.3)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.developer_mode,
                                size: 16,
                                color: Colors.orange[700],
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Development Mode',
                                style: TextStyle(
                                  color: Colors.orange[700],
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                
                // Device Information Cards
                Text(
                  'Device Information',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                
                DeviceInfoCard(
                  title: 'Device Name',
                  value: deviceInfo.deviceName,
                  icon: Icons.phone_android,
                  color: Colors.blue,
                ),
                const SizedBox(height: 12),
                
                DeviceInfoCard(
                  title: 'Operating System',
                  value: deviceInfo.osVersion,
                  icon: Icons.computer,
                  color: Colors.green,
                ),
                const SizedBox(height: 12),
                
                DeviceInfoCard(
                  title: 'Platform',
                  value: deviceInfo.platform,
                  icon: deviceInfo.platform.toLowerCase().contains('android') 
                      ? Icons.android 
                      : deviceInfo.platform.toLowerCase().contains('ios')
                          ? Icons.phone_iphone
                          : Icons.computer,
                  color: deviceInfo.platform.toLowerCase().contains('android') 
                      ? Colors.green
                      : deviceInfo.platform.toLowerCase().contains('ios')
                          ? Colors.blue
                          : Colors.orange,
                ),
                const SizedBox(height: 12),
                
                // Simulator Info Card (only shown in simulator)
                if (deviceInfo.deviceName.toLowerCase().contains('simulator') || 
                    deviceInfo.deviceName.toLowerCase().contains('emulator'))
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.amber.withOpacity(0.3)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.amber.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.sim_card,
                            color: Colors.amber[700],
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Simulator Environment',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber[700],
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Running in ${deviceInfo.platform}',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.amber[600],
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Battery level is simulated for testing',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Colors.amber[600],
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (deviceInfo.deviceName.toLowerCase().contains('simulator') || 
                    deviceInfo.deviceName.toLowerCase().contains('emulator'))
                  const SizedBox(height: 12),
                
                // Battery Card with Animation
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: deviceInfo.isCharging 
                              ? Colors.green.withOpacity(0.1)
                              : Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          deviceInfo.isCharging ? Icons.battery_charging_full : Icons.battery_std,
                          color: deviceInfo.isCharging ? Colors.green : Colors.red,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Battery Level',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  '${deviceInfo.batteryLevel}%',
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    color: deviceInfo.batteryLevel > 20 ? Colors.green : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (deviceInfo.deviceName.toLowerCase().contains('simulator') || 
                                    deviceInfo.deviceName.toLowerCase().contains('emulator'))
                                  Container(
                                    margin: const EdgeInsets.only(left: 8),
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.amber.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'SIM',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber[700],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: deviceInfo.batteryLevel / 100,
                              backgroundColor: Colors.grey[300],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                deviceInfo.batteryLevel > 20 ? Colors.green : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
        loading: () => const LoadingWidget(),
        error: (error, stackTrace) => custom.ErrorWidget(
          error: error.toString(),
          onRetry: () => ref.read(deviceInfoNotifierProvider.notifier).refreshDeviceInfo(),
        ),
      ),
    );
  }
}

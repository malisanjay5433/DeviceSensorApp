import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devicesensorapp/presentation/providers/device_sensor_provider.dart';
import 'package:devicesensorapp/presentation/widgets/device_sensor_card.dart';
import 'package:devicesensorapp/presentation/widgets/loading_widget.dart';
import 'package:devicesensorapp/presentation/widgets/error_widget.dart' as custom;

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSensorsAsync = ref.watch(deviceSensorNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Sensors'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(deviceSensorNotifierProvider.notifier).refreshSensors(),
          ),
        ],
      ),
      body: deviceSensorsAsync.when(
        data: (sensors) => sensors.isEmpty
            ? const Center(
                child: Text(
                  'No sensors found',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : RefreshIndicator(
                onRefresh: () => ref.read(deviceSensorNotifierProvider.notifier).refreshSensors(),
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: sensors.length,
                  itemBuilder: (context, index) {
                    final sensor = sensors[index];
                    return DeviceSensorCard(sensor: sensor);
                  },
                ),
              ),
        loading: () => const LoadingWidget(),
        error: (error, stackTrace) => custom.ErrorWidget(
          error: error.toString(),
          onRetry: () => ref.read(deviceSensorNotifierProvider.notifier).refreshSensors(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to add sensor page
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Add sensor functionality coming soon!')),
          );
        },
        tooltip: 'Add Sensor',
        child: const Icon(Icons.add),
      ),
    );
  }
}

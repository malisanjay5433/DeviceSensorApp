import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:devicesensorapp/presentation/providers/sensor_provider.dart';
import 'package:devicesensorapp/presentation/widgets/loading_widget.dart';
import 'package:devicesensorapp/presentation/widgets/error_widget.dart' as custom;

class SensorInfoPage extends ConsumerWidget {
  const SensorInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashlightAsync = ref.watch(flashlightNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensor Information'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section with Animation
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
                    height: 100,
                    child: Lottie.asset(
                      'assets/animations/welcome.json',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.sensors,
                          size: 60,
                          color: Colors.blue,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Flashlight Control',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Toggle device flashlight on/off',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Flashlight Section
            Text(
              'Flashlight Status',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            flashlightAsync.when(
              data: (flashlightState) => Container(
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: flashlightState.isOn 
                                ? Colors.amber.withOpacity(0.2)
                                : Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            flashlightState.isOn ? Icons.flashlight_on : Icons.flashlight_off,
                            color: flashlightState.isOn ? Colors.amber[700] : Colors.grey[600],
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Flashlight',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                flashlightState.isOn ? 'ON' : 'OFF',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: flashlightState.isOn ? Colors.green : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: flashlightState.isAvailable
                              ? () => ref.read(flashlightNotifierProvider.notifier).toggleFlashlight()
                              : null,
                          icon: Icon(
                            flashlightState.isOn ? Icons.flashlight_off : Icons.flashlight_on,
                          ),
                          label: Text(flashlightState.isOn ? 'Turn Off' : 'Turn On'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: flashlightState.isOn ? Colors.red : Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    if (!flashlightState.isAvailable)
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.warning,
                              color: Colors.orange[700],
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Flashlight not available on this device',
                              style: TextStyle(
                                color: Colors.orange[700],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              loading: () => const LoadingWidget(),
              error: (error, stackTrace) => custom.ErrorWidget(
                error: error.toString(),
                onRetry: () => ref.invalidate(flashlightNotifierProvider),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

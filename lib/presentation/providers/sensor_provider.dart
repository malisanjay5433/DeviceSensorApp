import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:devicesensorapp/domain/entities/sensor_data.dart';
import 'package:devicesensorapp/domain/usecases/get_flashlight_state.dart';
import 'package:devicesensorapp/core/di/injection.dart';

part 'sensor_provider.g.dart';

@riverpod
class FlashlightNotifier extends _$FlashlightNotifier {
  @override
  Future<FlashlightState> build() async {
    final getFlashlightState = getIt<GetFlashlightState>();
    final result = await getFlashlightState();
    
    return result.fold(
      (failure) => throw Exception(failure.toString()),
      (flashlightState) => flashlightState,
    );
  }

  Future<void> toggleFlashlight() async {
    final toggleFlashlight = getIt<ToggleFlashlight>();
    final result = await toggleFlashlight();
    
    result.fold(
      (failure) => throw Exception(failure.toString()),
      (_) {
        // Refresh the flashlight state after toggling
        ref.invalidateSelf();
      },
    );
  }
}

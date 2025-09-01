import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:devicesensorapp/domain/entities/sensor_data.dart';
import 'package:devicesensorapp/domain/usecases/get_flashlight_state.dart';
import 'package:devicesensorapp/core/di/injection.dart';

part 'sensor_provider.g.dart';

@riverpod
class FlashlightNotifier extends _$FlashlightNotifier {
  bool _isOn = false;
  bool _isToggling = false;

  @override
  Future<FlashlightState> build() async {
    final getFlashlightState = getIt<GetFlashlightState>();
    final result = await getFlashlightState();
    
    return result.fold(
      (failure) => throw Exception(failure.toString()),
      (flashlightState) => FlashlightState(
        isOn: _isOn,
        isAvailable: flashlightState.isAvailable,
      ),
    );
  }

  Future<void> toggleFlashlight() async {
    if (_isToggling) return; // Prevent multiple simultaneous toggles
    
    _isToggling = true;
    
    try {
      // Update UI immediately for better UX
      final currentState = await future;
      state = AsyncValue.data(FlashlightState(
        isOn: !currentState.isOn,
        isAvailable: currentState.isAvailable,
      ));
      
      final toggleFlashlight = getIt<ToggleFlashlight>();
      final result = await toggleFlashlight();
      
      result.fold(
        (failure) {
          // Revert state on failure
          state = AsyncValue.data(FlashlightState(
            isOn: currentState.isOn,
            isAvailable: currentState.isAvailable,
          ));
          throw Exception(failure.toString());
        },
        (_) {
          // Update the local state
          _isOn = !_isOn;
        },
      );
    } finally {
      _isToggling = false;
    }
  }

  bool get isToggling => _isToggling;
}

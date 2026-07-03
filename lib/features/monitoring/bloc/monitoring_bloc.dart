import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../data/repositories/vehicle_repository.dart';
import 'monitoring_event.dart';
import 'monitoring_state.dart';

@Injectable()
class MonitoringBloc extends Bloc<MonitoringEvent, MonitoringState> {
  final VehicleRepository _vehicleRepository;
  Timer? _simulationTimer;

  MonitoringBloc(this._vehicleRepository) : super(MonitoringStatInitial()) {
    on<FetchVehicleTelemetryEvent>(_onFetchVehicleTelemetryEvent);
    on<UpdateVehicleTelemetryEvent>(_onUpdateVehicleTelemetryEvent);
  }

  Future<void> _onFetchVehicleTelemetryEvent(
    FetchVehicleTelemetryEvent event,
    Emitter<MonitoringState> emit,
  ) async {
    emit(MonitoringStatLoading());

    try {
      final vehiclesData = await _vehicleRepository.getVehicleTelemetry();

      emit(MonitoringStatLoaded(vehicles: vehiclesData));

      _simulationTimer?.cancel();
      _simulationTimer = Timer.periodic(const Duration(seconds: 3), (_) {
        if (!isClosed) {
          add(UpdateVehicleTelemetryEvent());
        }
      });
    } catch (e) {
      emit(MonitoringStatError(message: e.toString()));
    }
  }

  void _onUpdateVehicleTelemetryEvent(
    UpdateVehicleTelemetryEvent event,
    Emitter<MonitoringState> emit,
  ) {
    if (state is MonitoringStatLoaded) {
      final currentState = state as MonitoringStatLoaded;
      if (currentState.vehicles.isEmpty) return;

      final updatedVehicles = List.of(currentState.vehicles);
      final connectedVehicle = updatedVehicles[0];

      // Menggunakan fungsi sinus berdasarkan waktu untuk membuat nilai naik turun secara natural
      final time = DateTime.now().millisecondsSinceEpoch / 1000.0;

      // Base RPM misalnya 1500, berayun ± 250
      double newRpm = 1500 + (sin(time) * 250);

      // Base Suhu 90, berayun ± 3
      double newTemp = 90 + (cos(time / 2) * 3);

      updatedVehicles[0] = connectedVehicle.copyWith(
        rpm: newRpm,
        engineTemperature: newTemp,
        lastUpdated: DateTime.now(),
      );

      emit(MonitoringStatLoaded(vehicles: updatedVehicles));
    }
  }

  @override
  Future<void> close() {
    _simulationTimer?.cancel();
    return super.close();
  }
}

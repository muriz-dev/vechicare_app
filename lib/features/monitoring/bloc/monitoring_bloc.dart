import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../data/repositories/vehicle_repository.dart';
import 'monitoring_event.dart';
import 'monitoring_state.dart';

@Injectable()
class MonitoringBloc extends Bloc<MonitoringEvent, MonitoringState> {
  final VehicleRepository _vehicleRepository;

  MonitoringBloc(this._vehicleRepository) : super(MonitoringStatInitial()) {
    on<FetchVehicleTelemetryEvent>(_onFetchVehicleTelemetryEvent);
  }

  Future<void> _onFetchVehicleTelemetryEvent(
    FetchVehicleTelemetryEvent event,
    Emitter<MonitoringState> emit,
  ) async {
    emit(MonitoringStatLoading());

    try {
      final vehicleData = await _vehicleRepository.getVehicleTelemetry();

      emit(MonitoringStatLoaded(vehicle: vehicleData));
    } catch (e) {
      emit(MonitoringStatError(message: e.toString()));
    }
  }
}

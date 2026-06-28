import '../../../data/models/vehicle_model.dart';

sealed class MonitoringState {}

class MonitoringStatInitial implements MonitoringState {}

class MonitoringStatLoading implements MonitoringState {}

class MonitoringStatLoaded implements MonitoringState {
  final VehicleModel vehicle;

  const MonitoringStatLoaded({required this.vehicle});
}

class MonitoringStatError implements MonitoringState {
  final String message;

  const MonitoringStatError({required this.message});
}

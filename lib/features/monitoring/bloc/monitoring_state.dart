import '../../../data/models/vehicle_model.dart';

sealed class MonitoringState {}

class MonitoringStatInitial implements MonitoringState {}

class MonitoringStatLoading implements MonitoringState {}

class MonitoringStatLoaded implements MonitoringState {
  final List<VehicleModel> vehicles;

  const MonitoringStatLoaded({required this.vehicles});
}

class MonitoringStatError implements MonitoringState {
  final String message;

  const MonitoringStatError({required this.message});
}

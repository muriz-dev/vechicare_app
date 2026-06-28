import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/injection.dart';
import '../bloc/monitoring_bloc.dart';
import '../bloc/monitoring_event.dart';
import '../bloc/monitoring_state.dart';

@RoutePage()
class DashboardPage extends StatelessWidget implements AutoRouteWrapper {
  const DashboardPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<MonitoringBloc>()..add(FetchVehicleTelemetryEvent()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitoringBloc, MonitoringState>(
      builder: (context, state) {
        if (state is MonitoringStatLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MonitoringStatLoaded) {
          final vehicle = state.vehicle;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Nama: ${vehicle.vehicleName}'),
                Text('Kecepatan: ${vehicle.speed} km/jam'),
                Text('Suhu Mesin: ${vehicle.engineTemperature}°C'),
                Text('Baterai/Bensin: ${vehicle.fuelBatteryLevel}%'),
                Text('Apakah Mesin Menyala: ${vehicle.isEngineOn}'),
                Text('Latitude: ${vehicle.latitude}'),
                Text('Longitude: ${vehicle.longitude}'),
              ],
            ),
          );
        }

        if (state is MonitoringStatError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox.shrink();
      },
    );
  }
}

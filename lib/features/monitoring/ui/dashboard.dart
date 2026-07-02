import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vechicare_app/core/theme/app_sizes.dart';
import '../../../core/di/injection.dart';
import '../bloc/monitoring_bloc.dart';
import '../bloc/monitoring_event.dart';
import '../bloc/monitoring_state.dart';
import 'widgets/vehicle_carousel.dart';
import 'widgets/telemetry_grid.dart';
import 'widgets/warning_card.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';

@RoutePage()
class DashboardPage extends StatefulWidget implements AutoRouteWrapper {
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
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitoringBloc, MonitoringState>(
      builder: (context, state) {
        if (state is MonitoringStatLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MonitoringStatLoaded) {
          final vehicles = state.vehicles;

          return SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: AppSizes.pagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Halo, Riko Pratama',
                      style: AppTypography.headingMedium,
                    ),
                    const Text(
                      'Mari lihat kondisi kendaraanmu saat ini yuk!',
                      style: AppTypography.bodyRegular,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Analisis Kendaraan',
                      style: AppTypography.headingSmall,
                    ),
                    const SizedBox(height: 12),
                    VehicleCarousel(
                      vehicles: vehicles,
                      onPageChanged: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Data Realtime',
                      style: AppTypography.headingSmall,
                    ),
                    const SizedBox(height: 12),
                    if (vehicles.isNotEmpty)
                      TelemetryGrid(
                        vehicle: _selectedIndex < vehicles.length
                            ? vehicles[_selectedIndex]
                            : vehicles.first,
                      ),
                    const SizedBox(height: 16),
                    const Text('Peringatan', style: AppTypography.headingSmall),
                    const SizedBox(height: 12),
                    if (vehicles.isNotEmpty)
                      Column(
                        children: (_selectedIndex < vehicles.length
                                ? vehicles[_selectedIndex]
                                : vehicles.first)
                            .activeWarnings
                            .map((w) => WarningCard(
                                  title: w.title,
                                  subtitle: w.subtitle,
                                  severity: w.severity,
                                ))
                            .toList(),
                      ),
                  ],
                ),
              ),
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

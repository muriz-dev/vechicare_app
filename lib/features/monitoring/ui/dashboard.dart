import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vechicare_app/data/models/vehicle_model.dart';
import '../../../core/di/injection.dart';
import '../bloc/monitoring_bloc.dart';
import '../bloc/monitoring_event.dart';
import '../bloc/monitoring_state.dart';
import 'widgets/vehicle_carousel.dart';
import 'widgets/telemetry_grid.dart';
import 'widgets/warning_card.dart';

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

  List<Widget> _buildWarnings(VehicleModel vehicle) {
    final List<Widget> warnings = [];

    if (vehicle.rpm >= 5000) {
      warnings.add(
        const WarningCard(
          title: 'Putaran Mesin Kritis',
          subtitle: 'RPM sangat tinggi. Kurangi kecepatan segera.',
          severity: WarningSeverity.high,
        ),
      );
    } else if (vehicle.rpm >= 3500) {
      warnings.add(
        const WarningCard(
          title: 'Putaran Mesin Tinggi',
          subtitle: 'RPM mesin di atas batas efisien.',
          severity: WarningSeverity.medium,
        ),
      );
    }

    if (vehicle.engineTemperature >= 100) {
      warnings.add(
        const WarningCard(
          title: 'Suhu Mesin Panas',
          subtitle: 'Suhu pendingin mencapai batas kritis. Segera menepi.',
          severity: WarningSeverity.high,
        ),
      );
    } else if (vehicle.engineTemperature >= 85) {
      warnings.add(
        const WarningCard(
          title: 'Suhu Mesin Meningkat',
          subtitle: 'Perhatikan indikator suhu, mesin mulai panas.',
          severity: WarningSeverity.medium,
        ),
      );
    }

    if (vehicle.fuelConsumption <= 5) {
      warnings.add(
        const WarningCard(
          title: 'Konsumsi BBM Boros',
          subtitle: 'Kendaraan sangat tidak efisien saat ini.',
          severity: WarningSeverity.high,
        ),
      );
    } else if (vehicle.fuelConsumption <= 8) {
      warnings.add(
        const WarningCard(
          title: 'Konsumsi BBM Kurang Efisien',
          subtitle: 'Pertimbangkan untuk mengemudi lebih halus.',
          severity: WarningSeverity.medium,
        ),
      );
    }

    if (vehicle.fuelBatteryLevel <= 20) {
      warnings.add(
        const WarningCard(
          title: 'Sisa Energi Kritis',
          subtitle: 'Segera isi ulang bahan bakar atau baterai.',
          severity: WarningSeverity.high,
        ),
      );
    } else if (vehicle.fuelBatteryLevel <= 40) {
      warnings.add(
        const WarningCard(
          title: 'Sisa Energi Rendah',
          subtitle: 'Rencanakan pengisian ulang energi.',
          severity: WarningSeverity.medium,
        ),
      );
    }

    if (warnings.isEmpty) {
      warnings.add(
        const WarningCard(
          title: 'Sistem Normal',
          subtitle: 'Semua komponen berjalan dengan baik.',
          severity: WarningSeverity.low,
        ),
      );
    }

    return warnings;
  }

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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Halo, Budi!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Analisis Kendaraan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
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
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (vehicles.isNotEmpty)
                      TelemetryGrid(
                        vehicle: _selectedIndex < vehicles.length
                            ? vehicles[_selectedIndex]
                            : vehicles.first,
                      ),
                    const SizedBox(height: 16),
                    const Text(
                      'Peringatan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (vehicles.isNotEmpty)
                      Column(
                        children: _buildWarnings(
                          _selectedIndex < vehicles.length
                              ? vehicles[_selectedIndex]
                              : vehicles.first,
                        ),
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

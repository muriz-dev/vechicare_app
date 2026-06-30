import 'package:flutter/material.dart';
import '../../../../data/models/vehicle_model.dart';
import 'metric_card.dart';

class TelemetryGrid extends StatelessWidget {
  final VehicleModel vehicle;

  const TelemetryGrid({super.key, required this.vehicle});

  MetricStatus _getRpmStatus(double rpm) {
    if (rpm >= 5000) return MetricStatus.danger;
    if (rpm >= 3500) return MetricStatus.warning;
    return MetricStatus.good;
  }

  MetricStatus _getTempStatus(double temp) {
    if (temp >= 100) return MetricStatus.danger;
    if (temp >= 85) return MetricStatus.warning;
    return MetricStatus.good;
  }

  MetricStatus _getFuelConsStatus(double fuelCons) {
    if (fuelCons <= 5) return MetricStatus.danger;
    if (fuelCons <= 8) return MetricStatus.warning;
    return MetricStatus.good;
  }

  MetricStatus _getBatteryStatus(int level) {
    if (level <= 20) return MetricStatus.danger;
    if (level <= 40) return MetricStatus.warning;
    return MetricStatus.good;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.1,
      children: [
        MetricCard(
          icon: Icons.speed,
          value: '${vehicle.rpm.toInt()}',
          label: 'RPM',
          status: _getRpmStatus(vehicle.rpm),
        ),
        MetricCard(
          icon: Icons.directions_car_outlined,
          value: '${vehicle.fuelConsumption}',
          label: 'Fuel Cons.',
          status: _getFuelConsStatus(vehicle.fuelConsumption),
        ),
        MetricCard(
          icon: Icons.thermostat_outlined,
          value: '${vehicle.engineTemperature.toInt()}°C',
          label: 'Coolant Temp',
          status: _getTempStatus(vehicle.engineTemperature),
        ),
        MetricCard(
          icon: Icons.battery_charging_full,
          value: '${vehicle.fuelBatteryLevel}%',
          label: 'Fuel / Battery',
          status: _getBatteryStatus(vehicle.fuelBatteryLevel),
        ),
      ],
    );
  }
}

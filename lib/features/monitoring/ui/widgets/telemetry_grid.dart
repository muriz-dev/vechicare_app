import 'package:flutter/material.dart';
import '../../../../data/models/vehicle_model.dart';
import 'metric_card.dart';

class TelemetryGrid extends StatelessWidget {
  final VehicleModel vehicle;

  const TelemetryGrid({super.key, required this.vehicle});

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
          status: vehicle.rpmStatus,
        ),
        MetricCard(
          icon: Icons.directions_car_outlined,
          value: '${vehicle.fuelConsumption}',
          label: 'Fuel Cons.',
          status: vehicle.fuelConsumptionStatus,
        ),
        MetricCard(
          icon: Icons.thermostat_outlined,
          value: '${vehicle.engineTemperature.toInt()}°C',
          label: 'Coolant Temp',
          status: vehicle.engineTemperatureStatus,
        ),
        MetricCard(
          icon: Icons.battery_charging_full,
          value: '${vehicle.fuelBatteryLevel}%',
          label: 'Fuel / Battery',
          status: vehicle.fuelBatteryLevelStatus,
        ),
      ],
    );
  }
}

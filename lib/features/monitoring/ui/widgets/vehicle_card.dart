import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../../data/models/vehicle_model.dart';

class VehicleCard extends StatelessWidget {
  final VehicleModel vehicle;

  const VehicleCard({super.key, required this.vehicle});

  int _calculateHealthScore(VehicleModel v) {
    int score = 100;
    
    if (v.rpm >= 5000) {
      score -= 25;
    } else if (v.rpm >= 3500) {
      score -= 10;
    }
    
    if (v.engineTemperature >= 100) {
      score -= 25;
    } else if (v.engineTemperature >= 85) {
      score -= 10;
    }
    
    if (v.fuelConsumption <= 5) {
      score -= 25;
    } else if (v.fuelConsumption <= 8) {
      score -= 10;
    }
    
    if (v.fuelBatteryLevel <= 20) {
      score -= 25;
    } else if (v.fuelBatteryLevel <= 40) {
      score -= 10;
    }
    
    return score.clamp(0, 100);
  }

  @override
  Widget build(BuildContext context) {
    final healthScore = _calculateHealthScore(vehicle);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    startAngle: 270,
                    endAngle: 270,
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    axisLineStyle: const AxisLineStyle(
                      thickness: 0.2,
                      color: Color.fromARGB(30, 0, 169, 181),
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: healthScore.toDouble(),
                        color: healthScore >= 80
                            ? Colors.green
                            : healthScore >= 60
                            ? Colors.yellow
                            : Colors.red,
                        cornerStyle: CornerStyle.bothCurve,
                        width: 0.2,
                        sizeUnit: GaugeSizeUnit.factor,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        positionFactor: 0,
                        angle: 90,
                        widget: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '$healthScore',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Skor',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vehicle.vehicleName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text('RPM: ${vehicle.rpm}'),
                  Text('Temp: ${vehicle.engineTemperature} °C'),
                  Text('Fuel: ${vehicle.fuelBatteryLevel}%'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ScanningGauge extends StatelessWidget {
  final int progress;
  final String stepName;

  const ScanningGauge({
    super.key,
    required this.progress,
    required this.stepName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
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
              thickness: 0.1,
              color: Color.fromARGB(
                30,
                0,
                100,
                255,
              ), // Light blue background
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                value: progress.toDouble(),
                color: const Color(
                  0xFF1976D2,
                ), // Darker blue like in mockup
                cornerStyle: CornerStyle.bothCurve,
                width: 0.1,
                sizeUnit: GaugeSizeUnit.factor,
                enableAnimation: true,
                animationDuration: 150,
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
                      '$progress%',
                      style: const TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      stepName,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

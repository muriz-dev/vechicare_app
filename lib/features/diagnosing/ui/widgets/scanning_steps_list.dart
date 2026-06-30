import 'package:flutter/material.dart';

class ScanningStepsList extends StatelessWidget {
  final List<String> steps;
  final int currentStep;

  const ScanningStepsList({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: List.generate(steps.length, (index) {
          bool isCompleted = index < currentStep;
          bool isCurrent = index == currentStep;
          Color defaultColor = isDark ? Colors.white : Colors.black87;

          IconData iconData;
          Color iconColor;
          Color textColor;

          if (isCompleted) {
            iconData = Icons.check_circle_outline;
            iconColor = defaultColor;
            textColor = defaultColor;
          } else if (isCurrent) {
            iconData = Icons.circle;
            iconColor = const Color(0xFF1976D2);
            textColor = const Color(0xFF1976D2);
          } else {
            iconData = Icons.radio_button_unchecked;
            iconColor = defaultColor;
            textColor = Colors.grey;
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              children: [
                Icon(iconData, color: iconColor, size: 28),
                const SizedBox(width: 16),
                Text(
                  steps[index],
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                    fontWeight: isCurrent
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

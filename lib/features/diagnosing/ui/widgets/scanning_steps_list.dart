import 'package:flutter/material.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: List.generate(steps.length, (index) {
          bool isCompleted = index < currentStep;
          bool isCurrent = index == currentStep;

          IconData iconData;
          Color iconColor;
          Color textColor;

          if (isCompleted) {
            iconData = Icons.check_circle_outline;
            iconColor = AppColors.success;
            textColor = AppColors.success;
          } else if (isCurrent) {
            iconData = Icons.circle;
            iconColor = AppColors.primary;
            textColor = AppColors.primary;
          } else {
            iconData = Icons.radio_button_unchecked;
            iconColor = AppColors.textMuted;
            textColor = AppColors.textMuted;
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              children: [
                Icon(iconData, color: iconColor, size: 28),
                const SizedBox(width: 16),
                Text(
                  steps[index],
                  style: AppTypography.headingXSmall.copyWith(
                    color: textColor,
                    fontWeight: isCurrent ? FontWeight.bold : FontWeight.w600,
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

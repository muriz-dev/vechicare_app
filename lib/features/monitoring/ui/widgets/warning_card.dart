import 'package:flutter/material.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';

enum WarningSeverity { low, medium, high }

class WarningCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final WarningSeverity severity;

  const WarningCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.severity = WarningSeverity.medium,
  });

  Color get _severityColor {
    switch (severity) {
      case WarningSeverity.low:
        return AppColors.success;
      case WarningSeverity.medium:
        return AppColors.warning;
      case WarningSeverity.high:
        return AppColors.alert;
    }
  }

  IconData get _severityIcon {
    switch (severity) {
      case WarningSeverity.low:
        return Icons.info_outline;
      case WarningSeverity.medium:
        return Icons.warning_amber_rounded;
      case WarningSeverity.high:
        return Icons.dangerous_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isDark ? AppColors.secondary : AppColors.scaffoldBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: 4, color: _severityColor),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(_severityIcon, color: _severityColor, size: 28),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title, style: AppTypography.headingXSmall),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

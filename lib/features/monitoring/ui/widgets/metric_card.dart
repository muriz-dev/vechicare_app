import 'package:flutter/material.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';
import '../../../../data/models/vehicle_enums.dart';

class MetricCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final MetricStatus status;

  const MetricCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    this.status = MetricStatus.none,
  });

  Color _getStatusColor() {
    switch (status) {
      case MetricStatus.good:
        return AppColors.success;
      case MetricStatus.warning:
        return AppColors.warning;
      case MetricStatus.danger:
        return AppColors.alert;
      case MetricStatus.none:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.primaryAccent, size: 28),
              if (status != MetricStatus.none)
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: _getStatusColor(),
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
          const Spacer(),
          Text(
            value,
            style: AppTypography.headingMedium.copyWith(
              color: AppColors.textLight,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.primaryAccent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';

class DongleStatus extends StatelessWidget {
  final String vehicleName;

  const DongleStatus({super.key, required this.vehicleName});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      color: AppColors.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.success,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Sedang Terhubung ke $vehicleName',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.bluetooth, size: 16, color: AppColors.textDark),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';

class VehicleSection extends StatelessWidget {
  const VehicleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Kendaraan Saya',
          style: AppTypography.headingSmall.copyWith(color: AppColors.textDark),
        ),
        const SizedBox(height: 12),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0.1,
          color: AppColors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const Icon(
              Icons.directions_car,
              color: AppColors.secondary,
            ),
            title: Text(
              '3 Kendaraan Terdaftar',
              style: AppTypography.headingXSmall.copyWith(
                color: AppColors.secondaryAccent,
              ),
            ),
            trailing: const Icon(
              Icons.chevron_right,
              color: AppColors.secondaryAccent,
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

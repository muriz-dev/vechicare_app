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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Kendaraan Saya',
              style: AppTypography.headingSmall.copyWith(
                color: AppColors.textDark,
              ),
            ),
            Text(
              '+ Tambah',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.secondaryAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          color: AppColors.scaffoldBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const Icon(
              Icons.directions_car,
              color: AppColors.secondary,
            ),
            title: Text(
              'Honda Brio Satya',
              style: AppTypography.headingXSmall.copyWith(
                color: AppColors.secondaryAccent,
              ),
            ),
            subtitle: Text(
              'B 1234 ABC • Skor: 85',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textMuted,
                fontWeight: FontWeight.w500,
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

import 'package:flutter/material.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';

class WarningCard extends StatelessWidget {
  final String title;
  final String date;
  final String description;
  final Color indicatorColor;

  const WarningCard({
    super.key,
    this.title = 'Kampas Rem Depan Aus',
    this.date = 'Ditemukan 3 hari lalu',
    this.description = 'Sisa ketebalan kampas rem depan tersisa 35%. Disarankan untuk mengganti dalam 2 minggu ke depan',
    this.indicatorColor = Colors.amber,
  });

  String get _label {
    if (indicatorColor == Colors.red) return 'KRITIS';
    if (indicatorColor == AppColors.primary) return 'INFO';
    return 'PERINGATAN';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: 4, color: indicatorColor),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _label,
                      style: AppTypography.labelSmall.copyWith(
                        color: indicatorColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: AppTypography.headingXSmall.copyWith(
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textMuted,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: AppTypography.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

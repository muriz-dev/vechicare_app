import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vechicare_app/core/routes/app_router.dart';
import 'package:vechicare_app/core/theme/app_sizes.dart';
import 'package:vechicare_app/features/diagnosing/ui/widgets/current_status_card.dart';
import 'package:vechicare_app/features/diagnosing/ui/widgets/start_scan_card.dart';
import 'package:vechicare_app/features/diagnosing/ui/widgets/warning_card.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';

@RoutePage()
class DiagnosisProcessPage extends StatelessWidget {
  const DiagnosisProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: AppSizes.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Diagnosa Kendaraan',
              style: AppTypography.headingMedium.copyWith(
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 16),

            // 1. Scan Card
            StartScanCard(
              onScanPressed: () {
                context.router.push(const ScanningRoute());
              },
            ),
            const SizedBox(height: 16),

            // 2. Status Terkini
            Text(
              'Status Terkini',
              style: AppTypography.headingSmall.copyWith(
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 12),
            const CurrentStatusCard(),
            const SizedBox(height: 16),

            // 3. Temuan Terakhir
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Temuan Terakhir',
                  style: AppTypography.headingSmall.copyWith(
                    color: AppColors.textDark,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.router.push(const DiagnosisHistoryRoute());
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Riwayat',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.secondaryAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: AppColors.secondaryAccent,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const WarningCard(),
          ],
        ),
      ),
    );
  }
}

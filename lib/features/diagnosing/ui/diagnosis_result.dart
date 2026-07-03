import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vechicare_app/core/theme/app_sizes.dart';
import 'package:vechicare_app/features/diagnosing/cubit/diagnosis_state.dart';
import 'package:vechicare_app/features/diagnosing/ui/widgets/finding_card.dart';
import 'package:vechicare_app/features/diagnosing/ui/widgets/score_gauge.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';

@RoutePage()
class DiagnosisResultPage extends StatelessWidget {
  final int score;
  final List<DiagnosisFinding> findings;

  const DiagnosisResultPage({
    super.key,
    required this.score,
    required this.findings,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.router.back(),
        ),
        title: Text(
          'Hasil Diagnosa',
          style: AppTypography.headingMedium.copyWith(
            color: AppColors.textDark,
          ),
        ),
        centerTitle: true,
        actions: [IconButton(icon: const Icon(Icons.share), onPressed: () {})],
        backgroundColor: AppColors.scaffoldBackground,
      ),
      backgroundColor: AppColors.scaffoldBackground,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: AppSizes.pagePadding,
        child: Column(
          children: [
            // Gauge for Score
            ScoreGauge(score: score),

            // Subtitle
            Text(
              'BAIK — Perlu Perhatian',
              style: AppTypography.headingMedium.copyWith(
                color: AppColors.textDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),

            // Temuan Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Temuan (${findings.length})',
                style: AppTypography.headingSmall.copyWith(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Cards
            ...findings.map(
              (finding) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: FindingCard(finding: finding),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

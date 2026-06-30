import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vechicare_app/features/diagnosing/cubit/diagnosis_state.dart';
import 'package:vechicare_app/features/diagnosing/ui/widgets/finding_card.dart';
import 'package:vechicare_app/features/diagnosing/ui/widgets/score_gauge.dart';

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
        title: const Text(
          'Hasil Diagnosa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [IconButton(icon: const Icon(Icons.share), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Gauge for Score
            ScoreGauge(score: score),

            // Subtitle
            const Text(
              'BAIK — Perlu Perhatian',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),

            // Temuan Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Temuan (${findings.length})',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Cards
            ...findings.map((finding) => FindingCard(finding: finding)),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vechicare_app/core/routes/app_router.dart';
import 'package:vechicare_app/features/diagnosing/ui/widgets/current_status_card.dart';
import 'package:vechicare_app/features/diagnosing/ui/widgets/start_scan_card.dart';
import 'package:vechicare_app/features/diagnosing/ui/widgets/warning_card.dart';

@RoutePage()
class DiagnosisProcessPage extends StatelessWidget {
  const DiagnosisProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Diagnosa Kendaraan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(icon: const Icon(Icons.history), onPressed: () {}),
              ],
            ),
            const SizedBox(height: 24),

            // 1. Scan Card
            StartScanCard(
              onScanPressed: () {
                context.router.push(const ScanningRoute());
              },
            ),
            const SizedBox(height: 24),

            // 2. Status Terkini
            const Text(
              'Status Terkini',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const CurrentStatusCard(),
            const SizedBox(height: 24),

            // 3. Temuan Terakhir
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Temuan Terakhir',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(onPressed: () {}, child: const Text('Riwayat >')),
              ],
            ),
            const SizedBox(height: 8),

            // Custom Warning Card (without AI elements)
            const WarningCard(),
          ],
        ),
      ),
    );
  }
}

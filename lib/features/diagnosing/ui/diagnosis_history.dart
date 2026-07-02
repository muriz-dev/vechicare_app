import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';
import 'package:vechicare_app/features/diagnosing/ui/widgets/warning_card.dart';

@RoutePage()
class DiagnosisHistoryPage extends StatelessWidget {
  const DiagnosisHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for history
    final historyData = [
      {
        'date': 'Hari ini, 10:30 WIB',
        'findings': [
          {
            'title': 'Tekanan Ban Rendah',
            'date': 'Ditemukan hari ini',
            'description':
                'Tekanan ban depan kiri terdeteksi 28 PSI (Normal: 32-35 PSI). Segera tambah tekanan angin.',
            'color': Colors.red,
          },
          {
            'title': 'Kampas Rem Depan Aus',
            'date': 'Ditemukan hari ini',
            'description':
                'Sisa ketebalan kampas rem depan tersisa 35%. Disarankan untuk mengganti dalam 2 minggu ke depan.',
            'color': Colors.amber,
          },
        ],
      },
      {
        'date': '15 Juni 2026, 14:15 WIB',
        'findings': [
          {
            'title': 'Oli Mesin Kotor',
            'date': 'Ditemukan 15 Juni 2026',
            'description':
                'Kualitas oli terdeteksi menurun. Jadwalkan penggantian oli segera.',
            'color': Colors.amber,
          },
        ],
      },
      {
        'date': '10 Mei 2026, 09:00 WIB',
        'findings': [
          {
            'title': 'Tegangan Baterai Lemah',
            'date': 'Ditemukan 10 Mei 2026',
            'description':
                'Tegangan baterai aki terdeteksi 11.5V. Periksa sistem pengisian atau ganti aki bila perlu.',
            'color': Colors.red,
          },
          {
            'title': 'Servis Rutin Mendekat',
            'date': 'Ditemukan 10 Mei 2026',
            'description':
                'Kendaraan Anda mendekati jadwal servis rutin dalam 500 km. Silakan jadwalkan kunjungan ke bengkel.',
            'color': AppColors.primary,
          },
        ],
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Riwayat Diagnosa',
          style: AppTypography.headingMedium.copyWith(
            color: AppColors.textDark,
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => context.router.maybePop(),
        ),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemCount: historyData.length,
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemBuilder: (context, index) {
          final history = historyData[index];
          final date = history['date'] as String;
          final findings = history['findings'] as List<Map<String, dynamic>>;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ...findings.map((finding) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: WarningCard(
                    title: finding['title'] as String,
                    date: finding['date'] as String,
                    description: finding['description'] as String,
                    indicatorColor: finding['color'] as Color,
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}

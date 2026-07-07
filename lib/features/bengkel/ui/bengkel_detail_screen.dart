import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vechicare_app/core/routes/app_router.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_sizes.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';

import '../../../data/models/bengkel_model.dart';

@RoutePage()
class BengkelDetailScreen extends StatelessWidget {
  final BengkelModel bengkel;

  const BengkelDetailScreen({
    super.key,
    required this.bengkel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => context.router.back(),
        ),
        title: Text(
          'Detail Bengkel',
          style: AppTypography.headingMedium.copyWith(
            color: AppColors.textDark,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: AppSizes.pagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                        color: AppColors.primaryAccent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.build,
                          size: 64,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      bengkel.name,
                      style: AppTypography.headingMedium.copyWith(
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 18,
                          color: AppColors.warning,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${bengkel.ratingDisplay} (${bengkel.reviewCount} ulasan)',
                          style: AppTypography.bodyRegular.copyWith(
                            color: AppColors.textDark,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _InfoTile(
                      icon: Icons.location_on,
                      title: 'Alamat',
                      subtitle: bengkel.address,
                    ),
                    const SizedBox(height: 12),
                    _InfoTile(
                      icon: Icons.access_time,
                      title: 'Jam Operasional',
                      subtitle: bengkel.openHours,
                    ),
                    const SizedBox(height: 12),
                    _InfoTile(
                      icon: Icons.handyman,
                      title: 'Spesialisasi',
                      subtitle: bengkel.specialtiesDisplay,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Layanan Tersedia',
                      style: AppTypography.headingSmall.copyWith(
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: bengkel.specialties.map((specialty) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryAccent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            specialty,
                            style: AppTypography.bodyRegular.copyWith(
                              color: AppColors.primaryDark,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: AppSizes.pagePadding,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.router.push(
                      BookingRoute(bengkel: bengkel),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Booking Sekarang',
                    style: AppTypography.buttonText.copyWith(
                      color: AppColors.textLight,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primaryAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.bodyRegular.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: AppTypography.bodyRegular.copyWith(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

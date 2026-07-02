import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vechicare_app/core/theme/app_sizes.dart';
import 'package:vechicare_app/features/profile/ui/widgets/profile_header.dart';
import 'package:vechicare_app/features/profile/ui/widgets/vehicle_section.dart';
import 'package:vechicare_app/features/profile/ui/widgets/settings_card.dart';
import 'package:vechicare_app/features/profile/ui/widgets/settings_tile.dart';
import 'package:vechicare_app/features/profile/ui/widgets/logout_button.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: AppSizes.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Profil',
              style: AppTypography.headingMedium.copyWith(
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 16),

            const ProfileHeader(),
            const SizedBox(height: 32),

            const VehicleSection(),
            const SizedBox(height: 24),

            // Preferensi Pengguna
            const Text(
              'Preferensi Pengguna',
              style: AppTypography.headingSmall,
            ),
            const SizedBox(height: 8),
            SettingsCard(
              children: [
                SettingsTile(
                  icon: Icons.notifications_outlined,
                  title: 'Notifikasi',
                  onTap: () {},
                ),
                const SettingsDivider(),
                SettingsTile(
                  icon: Icons.language_outlined,
                  title: 'Bahasa',
                  trailing: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Indonesia',
                        style: TextStyle(color: AppColors.secondaryAccent),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.chevron_right,
                        color: AppColors.secondaryAccent,
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
                const SettingsDivider(),
                SettingsTile(
                  icon: Icons.dark_mode_outlined,
                  title: 'Mode Gelap',
                  trailing: Switch(value: false, onChanged: (val) {}),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Konfigurasi Kendaraan
            const Text(
              'Konfigurasi Kendaraan',
              style: AppTypography.headingSmall,
            ),
            const SizedBox(height: 8),
            SettingsCard(
              children: [
                SettingsTile(
                  icon: Icons.wifi_tethering,
                  title: 'Dongle OBD-II',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Pengaturan Aplikasi
            const Text(
              'Pengaturan Aplikasi',
              style: AppTypography.headingSmall,
            ),
            const SizedBox(height: 8),
            SettingsCard(
              children: [
                SettingsTile(
                  icon: Icons.help_outline,
                  title: 'Bantuan & FAQ',
                  onTap: () {},
                ),
                const SettingsDivider(),
                SettingsTile(
                  icon: Icons.description_outlined,
                  title: 'Syarat & Ketentuan',
                  onTap: () {},
                ),
                const SettingsDivider(),
                SettingsTile(
                  icon: Icons.info_outline,
                  title: 'Tentang VehiCare',
                  trailing: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'v1.0.0',
                        style: TextStyle(color: AppColors.secondaryAccent),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.chevron_right,
                        color: AppColors.secondaryAccent,
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Logout button
            const LogoutButton(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dicebear_core/dicebear_core.dart';
import 'package:dicebear_styles/dicebear_styles.dart';
import 'package:dicebear_styles/bottts_neutral.dart';
import 'package:vechicare_app/core/theme/app_sizes.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final avatar = Avatar(Style.parse(botttsNeutral), {'seed': 'Riko Pratama'});
    final svgString = avatar.svg;

    return SafeArea(
      child: SingleChildScrollView(
        padding: AppSizes.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Profil',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Profile Info Section
            Center(
              child: Column(
                children: [
                  ClipOval(
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: SvgPicture.string(svgString),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Riko Pratama',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'riko.pratama@email.com',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '+62 812-3456-7890',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Vehicle Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Kendaraan Saya',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(onPressed: () {}, child: const Text('+ Tambah')),
              ],
            ),
            Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              color: Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.directions_car, color: Colors.black),
                title: const Text(
                  'Honda Brio Satya',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('B 1234 ABC • Skor: 85'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 24),

            // Preferensi Pengguna
            const Text(
              'Preferensi Pengguna',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildSettingsCard([
              _buildListTile(
                Icons.notifications_outlined,
                'Notifikasi',
                onTap: () {},
              ),
              _buildDivider(),
              _buildListTile(
                Icons.dark_mode_outlined,
                'Mode Gelap',
                trailing: Switch(value: true, onChanged: (val) {}),
              ),
              _buildDivider(),
              _buildListTile(
                Icons.language_outlined,
                'Bahasa',
                trailing: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Indonesia', style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 4),
                    Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
                onTap: () {},
              ),
            ]),
            const SizedBox(height: 24),

            // Konfigurasi Kendaraan
            const Text(
              'Konfigurasi Kendaraan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildSettingsCard([
              _buildListTile(
                Icons.wifi_tethering,
                'Dongle OBD-II',
                onTap: () {},
              ),
            ]),
            const SizedBox(height: 24),

            // Pengaturan Aplikasi
            const Text(
              'Pengaturan Aplikasi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildSettingsCard([
              _buildListTile(Icons.help_outline, 'Bantuan & FAQ', onTap: () {}),
              _buildDivider(),
              _buildListTile(
                Icons.description_outlined,
                'Syarat & Ketentuan',
                onTap: () {},
              ),
              _buildDivider(),
              _buildListTile(
                Icons.info_outline,
                'Tentang VehiCare',
                trailing: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('v1.0.0', style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 4),
                    Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
                onTap: () {},
              ),
            ]),
            const SizedBox(height: 32),

            // Logout button
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Keluar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Colors.grey.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(children: children),
    );
  }

  Widget _buildListTile(
    IconData icon,
    String title, {
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, color: Colors.black12);
  }
}

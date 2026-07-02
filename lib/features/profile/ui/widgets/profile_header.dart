import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dicebear_core/dicebear_core.dart';
import 'package:dicebear_styles/dicebear_styles.dart';
import 'package:dicebear_styles/bottts_neutral.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  String? _svgString;

  @override
  void initState() {
    super.initState();
    _loadAvatar();
  }

  Future<void> _loadAvatar() async {
    // Generate avatar asynchronously in a separate isolate to prevent UI freeze
    final svg = await compute(_generateAvatarSvg, 'Riko Pratama');
    if (mounted) {
      setState(() {
        _svgString = svg;
      });
    }
  }

  static String _generateAvatarSvg(String seed) {
    final avatar = Avatar(Style.parse(botttsNeutral), {'seed': seed});
    return avatar.svg;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ClipOval(
            child: Container(
              width: 80,
              height: 80,
              color: AppColors.primaryAccent,
              child: _svgString == null
                  ? const Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                          strokeWidth: 2.5,
                        ),
                      ),
                    )
                  : SvgPicture.string(_svgString!),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Riko Pratama',
            style: AppTypography.headingMedium.copyWith(
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'riko.pratama@email.com',
            style: AppTypography.bodyRegular.copyWith(
              color: AppColors.textMuted,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

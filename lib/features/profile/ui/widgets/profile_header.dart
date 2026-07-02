import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dicebear_core/dicebear_core.dart';
import 'package:dicebear_styles/dicebear_styles.dart';
import 'package:dicebear_styles/bottts_neutral.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final avatar = Avatar(Style.parse(botttsNeutral), {'seed': 'Riko Pratama'});
    final svgString = avatar.svg;

    return Center(
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

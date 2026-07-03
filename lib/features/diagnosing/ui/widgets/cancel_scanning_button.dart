import 'package:flutter/material.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';

class CancelScanningButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CancelScanningButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.alert,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        'Batalkan Diagnosis',
        style: AppTypography.buttonText.copyWith(
          color: AppColors.textLight,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

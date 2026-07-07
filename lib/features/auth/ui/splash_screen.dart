import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vechicare_app/core/routes/app_router.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';

import '../../../core/di/injection.dart';
import '../../../data/repositories/auth_repository.dart';
import '../cubit/auth_cubit.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterSplash();
  }

  Future<void> _navigateAfterSplash() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final authCubit = getIt<AuthCubit>();
    final onboardingSeen = await authCubit.isOnboardingSeen();
    final currentUser = await getIt<AuthRepository>().currentUser;

    if (!mounted) return;

    if (!onboardingSeen) {
      context.router.replace(const OnboardingRoute());
    } else if (currentUser != null) {
      context.router.replace(const HomeRoute());
    } else {
      context.router.replace(const LoginRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.directions_car,
                size: 56,
                color: AppColors.textLight,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'VechiCare',
              style: AppTypography.headingMedium.copyWith(
                color: AppColors.textDark,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Vehicle Health AI',
              style: AppTypography.bodyRegular.copyWith(
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vechicare_app/core/routes/app_router.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: AppColors.scaffoldBackground,
      routes: [DashboardRoute(), DiagnosisProcessRoute(), ProfileRoute()],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          backgroundColor: AppColors.background,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.primaryAccent,
          selectedLabelStyle: AppTypography.bodySmall.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: AppTypography.bodySmall.copyWith(
            color: AppColors.primaryAccent,
          ),
          type: BottomNavigationBarType.fixed,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard, color: AppColors.primaryAccent),
              activeIcon: Icon(Icons.dashboard, color: AppColors.primary),
              label: 'Monitoring',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.build, color: AppColors.primaryAccent),
              activeIcon: Icon(Icons.build, color: AppColors.primary),
              label: 'Diagnosis',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: AppColors.primaryAccent),
              activeIcon: Icon(Icons.person, color: AppColors.primary),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}

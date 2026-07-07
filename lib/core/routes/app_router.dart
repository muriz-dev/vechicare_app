import 'package:auto_route/auto_route.dart';
import 'package:vechicare_app/features/monitoring/ui/dashboard.dart';
import 'package:vechicare_app/features/diagnosing/ui/diganosis_process.dart';
import 'package:vechicare_app/features/profile/ui/profile.dart';
import 'package:vechicare_app/home_page.dart';
import 'package:vechicare_app/features/diagnosing/ui/scanning.dart';
import 'package:vechicare_app/features/diagnosing/ui/diagnosis_result.dart';
import 'package:vechicare_app/features/diagnosing/ui/diagnosis_history.dart';
import 'package:vechicare_app/features/auth/ui/splash_screen.dart';
import 'package:vechicare_app/features/auth/ui/onboarding_screen.dart';
import 'package:vechicare_app/features/auth/ui/login_screen.dart';
import 'package:vechicare_app/features/auth/ui/register_screen.dart';
import 'package:vechicare_app/features/bengkel/ui/bengkel_list_screen.dart';
import 'package:vechicare_app/features/bengkel/ui/bengkel_detail_screen.dart';
import 'package:vechicare_app/features/bengkel/ui/booking_screen.dart';
import 'package:vechicare_app/data/models/bengkel_model.dart';
import 'package:collection/collection.dart'; // For ListEquality used by AutoRoute
import 'package:vechicare_app/features/diagnosing/cubit/diagnosis_state.dart'; // For DiagnosisFinding
import 'package:flutter/material.dart'; // Often needed for AutoRoute generated arguments like Key

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(
      page: HomeRoute.page,
      children: [
        AutoRoute(page: DashboardRoute.page, initial: true),
        AutoRoute(page: DiagnosisProcessRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),
    AutoRoute(page: ScanningRoute.page),
    AutoRoute(page: DiagnosisResultRoute.page),
    AutoRoute(page: DiagnosisHistoryRoute.page),
    AutoRoute(page: BengkelListRoute.page),
    AutoRoute(page: BengkelDetailRoute.page),
    AutoRoute(page: BookingRoute.page),
  ];
}

import 'package:auto_route/auto_route.dart';
import 'package:vechicare_app/features/monitoring/ui/dashboard.dart';
import 'package:vechicare_app/features/diagnosing/ui/diagnosis_result.dart';
import 'package:vechicare_app/features/profile/ui/profile.dart';
import 'package:vechicare_app/home_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      initial: true,
      children: [
        AutoRoute(page: DashboardRoute.page, initial: true),
        AutoRoute(page: DiagnosisResultRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),
  ];
}

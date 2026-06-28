import 'package:flutter/material.dart';
import 'package:vechicare_app/core/di/injection.dart';
import 'package:vechicare_app/core/routes/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(routerConfig: appRouter.config());
  }
}

// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [BengkelDetailScreen]
class BengkelDetailRoute extends PageRouteInfo<BengkelDetailRouteArgs> {
  BengkelDetailRoute({
    Key? key,
    required BengkelModel bengkel,
    List<PageRouteInfo>? children,
  }) : super(
         BengkelDetailRoute.name,
         args: BengkelDetailRouteArgs(key: key, bengkel: bengkel),
         initialChildren: children,
       );

  static const String name = 'BengkelDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BengkelDetailRouteArgs>();
      return BengkelDetailScreen(key: args.key, bengkel: args.bengkel);
    },
  );
}

class BengkelDetailRouteArgs {
  const BengkelDetailRouteArgs({this.key, required this.bengkel});

  final Key? key;

  final BengkelModel bengkel;

  @override
  String toString() {
    return 'BengkelDetailRouteArgs{key: $key, bengkel: $bengkel}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BengkelDetailRouteArgs) return false;
    return key == other.key && bengkel == other.bengkel;
  }

  @override
  int get hashCode => key.hashCode ^ bengkel.hashCode;
}

/// generated route for
/// [BengkelListScreen]
class BengkelListRoute extends PageRouteInfo<void> {
  const BengkelListRoute({List<PageRouteInfo>? children})
    : super(BengkelListRoute.name, initialChildren: children);

  static const String name = 'BengkelListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const BengkelListScreen());
    },
  );
}

/// generated route for
/// [BookingScreen]
class BookingRoute extends PageRouteInfo<BookingRouteArgs> {
  BookingRoute({
    Key? key,
    required BengkelModel bengkel,
    List<PageRouteInfo>? children,
  }) : super(
         BookingRoute.name,
         args: BookingRouteArgs(key: key, bengkel: bengkel),
         initialChildren: children,
       );

  static const String name = 'BookingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookingRouteArgs>();
      return BookingScreen(key: args.key, bengkel: args.bengkel);
    },
  );
}

class BookingRouteArgs {
  const BookingRouteArgs({this.key, required this.bengkel});

  final Key? key;

  final BengkelModel bengkel;

  @override
  String toString() {
    return 'BookingRouteArgs{key: $key, bengkel: $bengkel}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BookingRouteArgs) return false;
    return key == other.key && bengkel == other.bengkel;
  }

  @override
  int get hashCode => key.hashCode ^ bengkel.hashCode;
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const DashboardPage());
    },
  );
}

/// generated route for
/// [DiagnosisHistoryPage]
class DiagnosisHistoryRoute extends PageRouteInfo<void> {
  const DiagnosisHistoryRoute({List<PageRouteInfo>? children})
    : super(DiagnosisHistoryRoute.name, initialChildren: children);

  static const String name = 'DiagnosisHistoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DiagnosisHistoryPage();
    },
  );
}

/// generated route for
/// [DiagnosisProcessPage]
class DiagnosisProcessRoute extends PageRouteInfo<void> {
  const DiagnosisProcessRoute({List<PageRouteInfo>? children})
    : super(DiagnosisProcessRoute.name, initialChildren: children);

  static const String name = 'DiagnosisProcessRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DiagnosisProcessPage();
    },
  );
}

/// generated route for
/// [DiagnosisResultPage]
class DiagnosisResultRoute extends PageRouteInfo<DiagnosisResultRouteArgs> {
  DiagnosisResultRoute({
    Key? key,
    required int score,
    required List<DiagnosisFinding> findings,
    List<PageRouteInfo>? children,
  }) : super(
         DiagnosisResultRoute.name,
         args: DiagnosisResultRouteArgs(
           key: key,
           score: score,
           findings: findings,
         ),
         initialChildren: children,
       );

  static const String name = 'DiagnosisResultRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DiagnosisResultRouteArgs>();
      return DiagnosisResultPage(
        key: args.key,
        score: args.score,
        findings: args.findings,
      );
    },
  );
}

class DiagnosisResultRouteArgs {
  const DiagnosisResultRouteArgs({
    this.key,
    required this.score,
    required this.findings,
  });

  final Key? key;

  final int score;

  final List<DiagnosisFinding> findings;

  @override
  String toString() {
    return 'DiagnosisResultRouteArgs{key: $key, score: $score, findings: $findings}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DiagnosisResultRouteArgs) return false;
    return key == other.key &&
        score == other.score &&
        const ListEquality<DiagnosisFinding>().equals(findings, other.findings);
  }

  @override
  int get hashCode =>
      key.hashCode ^
      score.hashCode ^
      const ListEquality<DiagnosisFinding>().hash(findings);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingScreen();
    },
  );
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterScreen();
    },
  );
}

/// generated route for
/// [ScanningPage]
class ScanningRoute extends PageRouteInfo<void> {
  const ScanningRoute({List<PageRouteInfo>? children})
    : super(ScanningRoute.name, initialChildren: children);

  static const String name = 'ScanningRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ScanningPage();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

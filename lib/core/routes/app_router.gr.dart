// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

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

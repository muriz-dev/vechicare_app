enum MetricStatus { good, warning, danger, none }

enum WarningSeverity { low, medium, high }

class VehicleWarning {
  final String title;
  final String subtitle;
  final WarningSeverity severity;

  const VehicleWarning({
    required this.title,
    required this.subtitle,
    required this.severity,
  });
}

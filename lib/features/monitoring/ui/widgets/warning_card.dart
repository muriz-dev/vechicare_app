import 'package:flutter/material.dart';

enum WarningSeverity { low, medium, high }

class WarningCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final WarningSeverity severity;

  const WarningCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.severity = WarningSeverity.medium,
  });

  Color get _severityColor {
    switch (severity) {
      case WarningSeverity.low:
        return Colors.blue;
      case WarningSeverity.medium:
        return Colors.amber;
      case WarningSeverity.high:
        return Colors.red;
    }
  }

  IconData get _severityIcon {
    switch (severity) {
      case WarningSeverity.low:
        return Icons.info_outline;
      case WarningSeverity.medium:
        return Icons.warning_amber_rounded;
      case WarningSeverity.high:
        return Icons.dangerous_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : const Color(0xFFF5F6F8),
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: 4, color: _severityColor),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(_severityIcon, color: _severityColor, size: 28),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: isDark ? Colors.grey[300] : Colors.grey[600],
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

enum MetricStatus { good, warning, danger, none }

class MetricCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final MetricStatus status;

  const MetricCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    this.status = MetricStatus.none,
  });

  Color _getStatusColor() {
    switch (status) {
      case MetricStatus.good:
        return Colors.greenAccent;
      case MetricStatus.warning:
        return Colors.amber;
      case MetricStatus.danger:
        return Colors.redAccent;
      case MetricStatus.none:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: const Color(0xFF67B5DB), size: 28),
              if (status != MetricStatus.none)
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: _getStatusColor(),
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}

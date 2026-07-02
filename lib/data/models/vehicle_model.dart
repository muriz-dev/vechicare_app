import 'vehicle_enums.dart';

class VehicleModel {
  final String vehicleId;
  final String vehicleName;
  final double rpm;
  final double engineTemperature;
  final double fuelConsumption;
  final int fuelBatteryLevel;
  final double latitude;
  final double longitude;
  final DateTime lastUpdated;

  VehicleModel({
    required this.vehicleId,
    required this.vehicleName,
    required this.rpm,
    required this.engineTemperature,
    required this.fuelConsumption,
    required this.fuelBatteryLevel,
    required this.latitude,
    required this.longitude,
    required this.lastUpdated,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      vehicleId: json['vehicle_id'] as String,
      vehicleName: json['vehicle_name'] as String,
      rpm: (json['rpm'] as num).toDouble(),
      engineTemperature: (json['engine_temperature'] as num).toDouble(),
      fuelConsumption: (json['fuel_consumption'] as num).toDouble(),
      fuelBatteryLevel: json['fuel_battery_level'] as int,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'vehicle_id': vehicleId,
    'vehicle_name': vehicleName,
    'rpm': rpm,
    'engine_temperature': engineTemperature,
    'fuel_consumption': fuelConsumption,
    'fuel_battery_level': fuelBatteryLevel,
    'latitude': latitude,
    'longitude': longitude,
    'last_updated': lastUpdated.toIso8601String(),
  };

  VehicleModel copyWith({
    String? vehicleId,
    String? vehicleName,
    double? rpm,
    double? engineTemperature,
    double? fuelConsumption,
    int? fuelBatteryLevel,
    double? latitude,
    double? longitude,
    DateTime? lastUpdated,
  }) {
    return VehicleModel(
      vehicleId: vehicleId ?? this.vehicleId,
      vehicleName: vehicleName ?? this.vehicleName,
      rpm: rpm ?? this.rpm,
      engineTemperature: engineTemperature ?? this.engineTemperature,
      fuelConsumption: fuelConsumption ?? this.fuelConsumption,
      fuelBatteryLevel: fuelBatteryLevel ?? this.fuelBatteryLevel,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  // --- Domain Logic & Computed Properties ---

  int get healthScore {
    int score = 100;

    if (rpm >= 5000) {
      score -= 25;
    } else if (rpm >= 3500) {
      score -= 10;
    }

    if (engineTemperature >= 100) {
      score -= 25;
    } else if (engineTemperature >= 85) {
      score -= 10;
    }

    if (fuelConsumption <= 5) {
      score -= 25;
    } else if (fuelConsumption <= 8) {
      score -= 10;
    }

    if (fuelBatteryLevel <= 20) {
      score -= 25;
    } else if (fuelBatteryLevel <= 40) {
      score -= 10;
    }

    return score.clamp(0, 100);
  }

  String get lastUpdatedFormatted {
    final now = DateTime.now();
    final difference = now.difference(lastUpdated);
    
    if (difference.inDays > 0) {
      return 'Terakhir diperbarui ${difference.inDays} hari yang lalu';
    } else if (difference.inHours > 0) {
      return 'Terakhir diperbarui ${difference.inHours} jam yang lalu';
    } else if (difference.inMinutes > 0) {
      return 'Terakhir diperbarui ${difference.inMinutes} menit yang lalu';
    } else {
      return 'Baru saja diperbarui';
    }
  }

  MetricStatus get rpmStatus {
    if (rpm >= 5000) return MetricStatus.danger;
    if (rpm >= 3500) return MetricStatus.warning;
    return MetricStatus.good;
  }

  MetricStatus get engineTemperatureStatus {
    if (engineTemperature >= 100) return MetricStatus.danger;
    if (engineTemperature >= 85) return MetricStatus.warning;
    return MetricStatus.good;
  }

  MetricStatus get fuelConsumptionStatus {
    if (fuelConsumption <= 5) return MetricStatus.danger;
    if (fuelConsumption <= 8) return MetricStatus.warning;
    return MetricStatus.good;
  }

  MetricStatus get fuelBatteryLevelStatus {
    if (fuelBatteryLevel <= 20) return MetricStatus.danger;
    if (fuelBatteryLevel <= 40) return MetricStatus.warning;
    return MetricStatus.good;
  }

  List<VehicleWarning> get activeWarnings {
    final List<VehicleWarning> warnings = [];

    if (rpm >= 5000) {
      warnings.add(
        const VehicleWarning(
          title: 'Putaran Mesin Kritis',
          subtitle: 'RPM sangat tinggi. Kurangi kecepatan segera.',
          severity: WarningSeverity.high,
        ),
      );
    } else if (rpm >= 3500) {
      warnings.add(
        const VehicleWarning(
          title: 'Putaran Mesin Tinggi',
          subtitle: 'RPM mesin di atas batas efisien.',
          severity: WarningSeverity.medium,
        ),
      );
    }

    if (engineTemperature >= 100) {
      warnings.add(
        const VehicleWarning(
          title: 'Suhu Mesin Panas',
          subtitle: 'Suhu pendingin mencapai batas kritis. Segera menepi.',
          severity: WarningSeverity.high,
        ),
      );
    } else if (engineTemperature >= 85) {
      warnings.add(
        const VehicleWarning(
          title: 'Suhu Mesin Meningkat',
          subtitle: 'Perhatikan indikator suhu, mesin mulai panas.',
          severity: WarningSeverity.medium,
        ),
      );
    }

    if (fuelConsumption <= 5) {
      warnings.add(
        const VehicleWarning(
          title: 'Konsumsi BBM Boros',
          subtitle: 'Kendaraan sangat tidak efisien saat ini.',
          severity: WarningSeverity.high,
        ),
      );
    } else if (fuelConsumption <= 8) {
      warnings.add(
        const VehicleWarning(
          title: 'Konsumsi BBM Kurang Efisien',
          subtitle: 'Pertimbangkan untuk mengemudi lebih halus.',
          severity: WarningSeverity.medium,
        ),
      );
    }

    if (fuelBatteryLevel <= 20) {
      warnings.add(
        const VehicleWarning(
          title: 'Sisa Energi Kritis',
          subtitle: 'Segera isi ulang bahan bakar atau baterai.',
          severity: WarningSeverity.high,
        ),
      );
    } else if (fuelBatteryLevel <= 40) {
      warnings.add(
        const VehicleWarning(
          title: 'Sisa Energi Rendah',
          subtitle: 'Rencanakan pengisian ulang energi.',
          severity: WarningSeverity.medium,
        ),
      );
    }

    if (warnings.isEmpty) {
      warnings.add(
        const VehicleWarning(
          title: 'Sistem Normal',
          subtitle: 'Semua komponen berjalan dengan baik.',
          severity: WarningSeverity.low,
        ),
      );
    }

    return warnings;
  }
}

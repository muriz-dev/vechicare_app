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
}

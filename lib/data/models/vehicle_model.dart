class VehicleModel {
  final String vehicleId;
  final String vehicleName;
  final double speed;
  final double engineTemperature;
  final int fuelBatteryLevel;
  final bool isEngineOn;
  final double latitude;
  final double longitude;

  VehicleModel({
    required this.vehicleId,
    required this.vehicleName,
    required this.speed,
    required this.engineTemperature,
    required this.fuelBatteryLevel,
    required this.isEngineOn,
    required this.latitude,
    required this.longitude,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      vehicleId: json['vehicle_id'] as String,
      vehicleName: json['vehicle_name'] as String,
      speed: (json['speed'] as num).toDouble(),
      engineTemperature: (json['engine_temperature'] as num).toDouble(),
      fuelBatteryLevel: json['fuel_battery_level'] as int,
      isEngineOn: json['is_engine_on'] as bool,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'vehicle_id': vehicleId,
    'vehicle_name': vehicleName,
    'speed': speed,
    'engine_temperature': engineTemperature,
    'fuel_battery_level': fuelBatteryLevel,
    'is_engine_on': isEngineOn,
    'latitude': latitude,
    'longitude': longitude,
  };

  VehicleModel copyWith({
    String? vehicleId,
    String? vehicleName,
    double? speed,
    double? engineTemperature,
    int? fuelBatteryLevel,
    bool? isEngineOn,
    double? latitude,
    double? longitude,
  }) {
    return VehicleModel(
      vehicleId: vehicleId ?? this.vehicleId,
      vehicleName: vehicleName ?? this.vehicleName,
      speed: speed ?? this.speed,
      engineTemperature: engineTemperature ?? this.engineTemperature,
      fuelBatteryLevel: fuelBatteryLevel ?? this.fuelBatteryLevel,
      isEngineOn: isEngineOn ?? this.isEngineOn,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}

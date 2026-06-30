import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/vehicle_model.dart';
import '../../../data/repositories/vehicle_repository.dart';

@LazySingleton(as: VehicleRepository)
class MonitoringRepository implements VehicleRepository {
  @override
  Future<List<VehicleModel>> getVehicleTelemetry() async {
    await Future.delayed(const Duration(seconds: 1));

    final String response = await rootBundle.loadString(
      'assets/vehicle_telemetry.json',
    );

    final List<dynamic> data = json.decode(response);

    return data.map((json) => VehicleModel.fromJson(json)).toList();
  }
}

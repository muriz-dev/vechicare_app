import '../models/vehicle_model.dart';

abstract class VehicleRepository {
  Future<List<VehicleModel>> getVehicleTelemetry();
}

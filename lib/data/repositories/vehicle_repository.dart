import '../models/vehicle_model.dart';

abstract class VehicleRepository {
  Future<VehicleModel> getVehicleTelemetry();
}

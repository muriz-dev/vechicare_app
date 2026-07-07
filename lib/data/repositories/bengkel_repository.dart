import '../models/bengkel_model.dart';

abstract class BengkelRepository {
  Future<List<BengkelModel>> getBengkels();

  Future<BengkelModel?> getBengkel(String id);
}

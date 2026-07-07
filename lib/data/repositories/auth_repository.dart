import '../models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel?> get currentUser;

  Future<void> login(String email, String password);

  Future<void> register(String name, String email, String password);

  Future<void> logout();
}

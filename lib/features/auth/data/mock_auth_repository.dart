import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/user_model.dart';
import '../../../data/repositories/auth_repository.dart';

class _RegisteredUser {
  final String name;
  final String email;
  final String password;

  _RegisteredUser({
    required this.name,
    required this.email,
    required this.password,
  });
}

@LazySingleton(as: AuthRepository)
class MockAuthRepository implements AuthRepository {
  static const _sessionEmailKey = 'session_email';

  final List<_RegisteredUser> _users = [
    _RegisteredUser(
      name: 'Demo User',
      email: 'demo@vehicare.id',
      password: 'password',
    ),
  ];

  @override
  Future<UserModel?> get currentUser async {
    final prefs = await SharedPreferences.getInstance();
    final sessionEmail = prefs.getString(_sessionEmailKey);

    if (sessionEmail == null) return null;

    final user = _users.firstWhere(
      (u) => u.email == sessionEmail,
      orElse: () => _RegisteredUser(name: '', email: '', password: ''),
    );

    if (user.email.isEmpty) {
      await logout();
      return null;
    }

    return UserModel(name: user.name, email: user.email);
  }

  @override
  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final normalizedEmail = email.trim().toLowerCase();
    final user = _users.firstWhere(
      (u) => u.email == normalizedEmail && u.password == password,
      orElse: () => _RegisteredUser(name: '', email: '', password: ''),
    );

    if (user.email.isEmpty) {
      throw Exception('Email atau password salah');
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sessionEmailKey, user.email);
  }

  @override
  Future<void> register(String name, String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final normalizedEmail = email.trim().toLowerCase();

    if (normalizedEmail.isEmpty || password.isEmpty || name.isEmpty) {
      throw Exception('Semua field harus diisi');
    }

    final exists = _users.any((u) => u.email == normalizedEmail);
    if (exists) {
      throw Exception('Email sudah terdaftar');
    }

    _users.add(
      _RegisteredUser(
        name: name.trim(),
        email: normalizedEmail,
        password: password,
      ),
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sessionEmailKey, normalizedEmail);
  }

  @override
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_sessionEmailKey);
  }
}

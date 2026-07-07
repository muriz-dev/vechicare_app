import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/user_model.dart';
import '../../../data/repositories/auth_repository.dart';
import 'auth_state.dart';

@Injectable()
class AuthCubit extends Cubit<AuthState> {
  static const _onboardingSeenKey = 'onboarding_seen';

  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(AuthInitial());

  Future<bool> isOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingSeenKey) ?? false;
  }

  Future<void> setOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingSeenKey, true);
  }

  Future<void> checkSession() async {
    emit(AuthLoading());

    try {
      final user = await _authRepository.currentUser;

      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());

    try {
      await _authRepository.login(email, password);
      final user = await _authRepository.currentUser;

      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(const AuthError('Gagal mendapatkan data sesi'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> register(String name, String email, String password) async {
    emit(AuthLoading());

    try {
      await _authRepository.register(name, email, password);
      final user = await _authRepository.currentUser;

      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(const AuthError('Gagal mendapatkan data sesi'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout() async {
    await _authRepository.logout();
    emit(AuthUnauthenticated());
  }

  UserModel? get currentUser {
    if (state is AuthAuthenticated) {
      return (state as AuthAuthenticated).user;
    }
    return null;
  }
}

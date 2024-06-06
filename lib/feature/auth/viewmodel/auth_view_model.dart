import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:open_us_for_all/service/auth_service.dart';

// AuthService provider
final authServiceProvider =
    Provider((ref) => AuthService('http://192.168.1.8:8080'));

// Auth state provider
class AuthState {
  final String email;
  final String name;
  final String surname;
  final String accessToken;
  final String refreshToken;
  final int roleId;

  AuthState({
    required this.email,
    required this.name,
    required this.surname,
    required this.accessToken,
    required this.refreshToken,
    required this.roleId,
  });

  AuthState.initial()
      : email = '',
        name = '',
        surname = '',
        accessToken = '',
        refreshToken = '',
        roleId = 0;
}

// Auth ViewModel provider
class AuthViewModel extends StateNotifier<AuthState> {
  final AuthService _authService;
  final Box _authBox;

  AuthViewModel(this._authService, this._authBox) : super(AuthState.initial());

  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> login({required String? email, required String? password}) async {
    try {
      final response = await _authService.login(email!, password!);
      state = AuthState(
        email: response['mail'],
        name: response['firstName'],
        surname: response['lastName'],
        accessToken: response['accessToken'],
        refreshToken: response['refreshToken'],
        roleId: response['role'],
      );

      // Verileri Hive box'a kaydet
      await _authBox.put('email', state.email);
      await _authBox.put('name', state.name);
      await _authBox.put('surname', state.surname);
      await _authBox.put('accessToken', state.accessToken);
      await _authBox.put('refreshToken', state.refreshToken);
      await _authBox.put('roleId', state.roleId);
      return true;
    } catch (error) {
      print('Auth failed: $error');
      return false;
      
    }
  }
}

final authViewModel = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) {
    final authService = ref.watch(authServiceProvider);
    final authBox = Hive.box('authBox');
    return AuthViewModel(authService, authBox);
  },
);

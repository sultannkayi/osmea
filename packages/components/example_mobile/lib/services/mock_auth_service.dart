import 'package:osmea_components/osmea_components.dart';

class MyAuthService implements AuthService {
  @override
  Future<AuthResult> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    // Mock validation – replace this with real API call
    if (username == 'admin' && password == '123456') {
      return AuthResult.success(
        userDisplayName: 'Admin User',
        userData: {'id': 1, 'role': 'admin'},
      );
    }

    return AuthResult.failure(
      'Invalid credentials',
      errorType: AuthErrorType.invalidCredentials,
    );
  }

  @override
  Future<void> logout() async {
    // Logout operations can be performed here
    await Future.delayed(const Duration(milliseconds: 500));
  }
}

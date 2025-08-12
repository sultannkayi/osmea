import 'package:osmea_components/osmea_components.dart';

class ProductionAuthService implements AuthService {
  @override
  Future<AuthResult> login(String username, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Production authentication logic with specific credentials
    if (username.toLowerCase() == 'istanbul' && password == 'MasterFabric') {
      return AuthResult.success(
        userDisplayName: 'Istanbul User',
        userData: {'id': 1, 'role': 'user', 'location': 'Istanbul'},
      );
    }

    return AuthResult.failure(
      'Invalid credentials. Please use Istanbul / MasterFabric',
      errorType: AuthErrorType.invalidCredentials,
    );
  }

  @override
  Future<void> logout() async {
    // Production logout - replace with actual logout service
    await Future.delayed(const Duration(milliseconds: 200));
  }
}

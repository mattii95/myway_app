import 'package:myway_app/src/domain/models/auth_response.dart';
import 'package:myway_app/src/domain/models/user.dart';
import 'package:myway_app/src/domain/utils/resource.dart';

abstract class AuthRepository {
  Future<Resource<AuthResponse>> login(String email, String password);
  Future<Resource<AuthResponse>> register(User user);
  Future<void> saveUserSession(AuthResponse authResponse);
  Future<AuthResponse?> getUserSession();
  Future<bool> logout();
}

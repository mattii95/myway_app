import 'package:myway_app/src/data/datasources/local/shared_pref.dart';
import 'package:myway_app/src/data/datasources/remote/services/auth_service.dart';
import 'package:myway_app/src/domain/models/auth_response.dart';
import 'package:myway_app/src/domain/models/user.dart';
import 'package:myway_app/src/domain/repositories/auth_repository.dart';
import 'package:myway_app/src/domain/utils/resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  
  AuthService authService;
  SharedPref sharedPref;

  AuthRepositoryImpl(this.authService, this.sharedPref);

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authService.login(email, password);
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    return authService.register(user);
  }

  @override
  Future<AuthResponse?> getUserSession() async {
    final data = await sharedPref.read('user');
    if (data != null) {
      AuthResponse authResponse = AuthResponse.fromJson(data);
      return authResponse;
    }
    return null;
  }

  @override
  Future<void> saveUserSession(AuthResponse authResponse) async {
    await sharedPref.save('user', authResponse.toJson());
  }
  
  @override
  Future<bool> logout() async {
    return await sharedPref.remove('user');
  }
}

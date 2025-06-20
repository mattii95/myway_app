import 'package:myway_app/src/data/datasources/local/SharedPref.dart';
import 'package:myway_app/src/data/datasources/remote/services/AuthService.dart';
import 'package:myway_app/src/domain/models/AuthResponse.dart';
import 'package:myway_app/src/domain/models/User.dart';
import 'package:myway_app/src/domain/repositories/AuthRepository.dart';
import 'package:myway_app/src/domain/utils/Resource.dart';

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

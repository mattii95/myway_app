import 'package:myway_app/src/data/datasources/remote/services/AuthService.dart';
import 'package:myway_app/src/domain/models/AuthResponse.dart';
import 'package:myway_app/src/domain/repositories/AuthRepository.dart';
import 'package:myway_app/src/domain/utils/Resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthService authService;

  AuthRepositoryImpl(this.authService);

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authService.login(email, password);
  }
}

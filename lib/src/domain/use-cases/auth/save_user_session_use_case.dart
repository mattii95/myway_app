import 'package:myway_app/src/domain/models/auth_response.dart';
import 'package:myway_app/src/domain/repositories/auth_repository.dart';

class SaveUserSessionUseCase {
  AuthRepository authRepository;

  SaveUserSessionUseCase(this.authRepository);

  run(AuthResponse authResponse) => authRepository.saveUserSession(authResponse);
}
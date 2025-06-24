import 'package:myway_app/src/domain/repositories/auth_repository.dart';

class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  run(String email, String password) => authRepository.login(email, password);
}

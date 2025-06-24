import 'package:myway_app/src/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  AuthRepository authRepository;
  LogoutUseCase(this.authRepository);
  run() => authRepository.logout();
}

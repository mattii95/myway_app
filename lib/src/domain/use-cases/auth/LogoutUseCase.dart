import 'package:myway_app/src/domain/repositories/AuthRepository.dart';

class LogoutUseCase {
  AuthRepository authRepository;
  LogoutUseCase(this.authRepository);
  run() => authRepository.logout();
}

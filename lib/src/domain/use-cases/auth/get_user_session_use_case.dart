
import 'package:myway_app/src/domain/repositories/auth_repository.dart';

class GetUserSessionUseCase {
  AuthRepository authRepository;

  GetUserSessionUseCase(this.authRepository);

  run() => authRepository.getUserSession();
}

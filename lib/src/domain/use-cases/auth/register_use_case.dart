import 'package:myway_app/src/domain/models/user.dart';
import 'package:myway_app/src/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  run(User user) => authRepository.register(user);
}
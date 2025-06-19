import 'package:myway_app/src/domain/models/User.dart';
import 'package:myway_app/src/domain/repositories/AuthRepository.dart';

class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  run(User user) => authRepository.register(user);
}
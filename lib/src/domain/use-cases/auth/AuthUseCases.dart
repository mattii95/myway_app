import 'package:myway_app/src/domain/use-cases/auth/LoginUseCase.dart';
import 'package:myway_app/src/domain/use-cases/auth/RegisterUseCase.dart';

class AuthUseCases {
  LoginUseCase loginUseCase;
  RegisterUseCase registerUseCase;

  AuthUseCases({required this.loginUseCase, required this.registerUseCase});
}

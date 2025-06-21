import 'package:myway_app/src/domain/use-cases/auth/GetUserSessionUseCase.dart';
import 'package:myway_app/src/domain/use-cases/auth/LoginUseCase.dart';
import 'package:myway_app/src/domain/use-cases/auth/LogoutUseCase.dart';
import 'package:myway_app/src/domain/use-cases/auth/RegisterUseCase.dart';
import 'package:myway_app/src/domain/use-cases/auth/SaveUserSessionUseCase.dart';

class AuthUseCases {
  LoginUseCase loginUseCase;
  RegisterUseCase registerUseCase;
  SaveUserSessionUseCase saveUserSessionUseCase;
  GetUserSessionUseCase getUserSessionUseCase;
  LogoutUseCase logoutUseCase;

  AuthUseCases({
    required this.loginUseCase, 
    required this.registerUseCase,
    required this.saveUserSessionUseCase,
    required this.getUserSessionUseCase,
    required this.logoutUseCase,
  });
}

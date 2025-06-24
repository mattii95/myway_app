import 'package:myway_app/src/domain/use-cases/auth/get_user_session_use_case.dart';
import 'package:myway_app/src/domain/use-cases/auth/login_use_case.dart';
import 'package:myway_app/src/domain/use-cases/auth/logout_use_case.dart';
import 'package:myway_app/src/domain/use-cases/auth/register_use_case.dart';
import 'package:myway_app/src/domain/use-cases/auth/save_user_session_use_case.dart';

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

import 'package:injectable/injectable.dart';
import 'package:myway_app/src/data/datasources/local/shared_pref.dart';
import 'package:myway_app/src/data/datasources/remote/services/auth_service.dart';
import 'package:myway_app/src/data/repositories/auth_repository_impl.dart';
import 'package:myway_app/src/domain/repositories/auth_repository.dart';
import 'package:myway_app/src/domain/use-cases/auth/auth_use_case.dart';
import 'package:myway_app/src/domain/use-cases/auth/get_user_session_use_case.dart';
import 'package:myway_app/src/domain/use-cases/auth/login_use_case.dart';
import 'package:myway_app/src/domain/use-cases/auth/logout_use_case.dart';
import 'package:myway_app/src/domain/use-cases/auth/register_use_case.dart';
import 'package:myway_app/src/domain/use-cases/auth/save_user_session_use_case.dart';

@module
abstract class AppModule {
  @Injectable()
  SharedPref get sharedPref => SharedPref();

  @Injectable()
  AuthService get authService => AuthService();

  @Injectable()
  AuthRepository get authRepository =>
      AuthRepositoryImpl(authService, sharedPref);

  @Injectable()
  AuthUseCases get authUseCases => AuthUseCases(
    loginUseCase: LoginUseCase(authRepository),
    registerUseCase: RegisterUseCase(authRepository),
    saveUserSessionUseCase: SaveUserSessionUseCase(authRepository),
    getUserSessionUseCase: GetUserSessionUseCase(authRepository),
    logoutUseCase: LogoutUseCase(authRepository),
  );
}

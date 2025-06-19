import 'package:injectable/injectable.dart';
import 'package:myway_app/src/data/datasources/remote/services/AuthService.dart';
import 'package:myway_app/src/data/repositories/AuthRepositoryImpl.dart';
import 'package:myway_app/src/domain/repositories/AuthRepository.dart';
import 'package:myway_app/src/domain/use-cases/auth/AuthUseCases.dart';
import 'package:myway_app/src/domain/use-cases/auth/LoginUseCase.dart';
import 'package:myway_app/src/domain/use-cases/auth/RegisterUseCase.dart';

@module
abstract class AppModule {
  @Injectable()
  AuthService get authService => AuthService();

  @Injectable()
  AuthRepository get authRepository => AuthRepositoryImpl(authService);

  @Injectable()
  AuthUseCases get authUseCases => AuthUseCases(
    loginUseCase: LoginUseCase(authRepository),
    registerUseCase: RegisterUseCase(authRepository),
  );
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myway_app/injection.dart';
import 'package:myway_app/src/domain/use-cases/auth/AuthUseCases.dart';
import 'package:myway_app/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:myway_app/src/presentation/pages/auth/register/RegisterPage.dart';
import 'package:myway_app/src/presentation/pages/auth/register/bloc/register_bloc.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) {
        return BlocProvider<LoginBloc>(
          create:
              (_) => LoginBloc(locator<AuthUseCases>())..add(LoginInitEvent()),
          child: LoginPage(),
        );
      },
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) {
        return BlocProvider<RegisterBloc>(
          create:
              (_) => RegisterBloc()..add(RegisterInitialEvent()),
          child: RegisterPage(),
        );
      },
    ),
  ],
);

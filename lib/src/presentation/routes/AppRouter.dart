import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myway_app/injection.dart';
import 'package:myway_app/src/domain/use-cases/auth/AuthUseCases.dart';
import 'package:myway_app/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:myway_app/src/presentation/pages/auth/register/RegisterPage.dart';
import 'package:myway_app/src/presentation/pages/auth/register/bloc/register_bloc.dart';
import 'package:myway_app/src/presentation/pages/client/home/ClientHomePage.dart';
import 'package:myway_app/src/presentation/pages/client/home/bloc/client_home_bloc.dart';
import 'package:myway_app/src/presentation/pages/profile/info/ProfileInfoPage.dart';
import 'package:myway_app/src/presentation/pages/splash/SplashPage.dart';
import 'package:myway_app/src/presentation/views/home/ClientHomeView.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) {
        return BlocProvider<LoginBloc>(
          create:
              (_) => LoginBloc(locator<AuthUseCases>())..add(LoginInitEvent()),
          child: SplashPage(),
        );
      },
    ),
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
              (_) =>
                  RegisterBloc(locator<AuthUseCases>())
                    ..add(RegisterInitialEvent()),
          child: RegisterPage(),
        );
      },
    ),
    // GoRoute(
    //   path: '/client',
    //   name: 'client-home',
    //   builder: (context, state) => ClientHomePage(),
    // ),
    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider<ClientHomeBloc>(
          create: (_) => ClientHomeBloc(),
          child: ClientHomePage(childView: child),
        );
      },
      routes: [
        GoRoute(path: '/client', builder: (context, state) => ClientHomeView()),
        GoRoute(
          path: '/profile',
          builder: (context, state) => ProfileInfoPage(),
        ),
      ],
    ),
  ],
);

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myway_app/injection.dart';
import 'package:myway_app/src/domain/use-cases/auth/auth_use_case.dart';
import 'package:myway_app/src/presentation/pages/auth/login/login_page.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:myway_app/src/presentation/pages/auth/register/register_page.dart';
import 'package:myway_app/src/presentation/pages/auth/register/bloc/register_bloc.dart';
import 'package:myway_app/src/presentation/pages/client/home/client_home_page.dart';
import 'package:myway_app/src/presentation/pages/client/home/bloc/client_home_bloc.dart';
import 'package:myway_app/src/presentation/pages/profile/info/bloc/profile_info_bloc.dart';
import 'package:myway_app/src/presentation/pages/profile/info/profile_info_page.dart';
import 'package:myway_app/src/presentation/pages/profile/update/profile_update_page.dart';
import 'package:myway_app/src/presentation/pages/splash/splash_page.dart';
import 'package:myway_app/src/presentation/views/home/client_home_view.dart';

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
          create: (_) => ClientHomeBloc(locator<AuthUseCases>()),
          child: ClientHomePage(childView: child),
        );
      },
      routes: [
        GoRoute(path: '/client', builder: (context, state) => ClientHomeView()),
        GoRoute(
          path: '/profile',
          builder:
              (context, state) => BlocProvider(
                create:
                    (context) =>
                        ProfileInfoBloc(locator<AuthUseCases>())
                          ..add(GetUserInfo()),
                child: ProfileInfoPage(),
              ),
        ),
      ],
    ),
    GoRoute(path: '/profile/update', builder: (context, state) => ProfileUpdatePage()),
  ],
);

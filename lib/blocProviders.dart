import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myway_app/injection.dart';
import 'package:myway_app/src/domain/use-cases/auth/AuthUseCases.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:myway_app/src/presentation/pages/auth/register/bloc/register_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(create: (context) => LoginBloc(locator<AuthUseCases>())..add(LoginInitEvent())),
  BlocProvider<RegisterBloc>(create: (context) => RegisterBloc()..add(RegisterInitialEvent())),
];
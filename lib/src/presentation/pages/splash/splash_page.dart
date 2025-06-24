import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myway_app/src/domain/utils/resource.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/login_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          final response = state.response;
          if (response is Success) {
            context.go('/client');
          } else {
            context.go('/login');
          }
        },
        child: Center(child: CircularProgressIndicator(strokeWidth: 4)),
      ),
    );
  }
}

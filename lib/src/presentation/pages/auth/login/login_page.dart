import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:myway_app/src/domain/models/auth_response.dart';
import 'package:myway_app/src/domain/utils/resource.dart';
import 'package:myway_app/src/presentation/pages/auth/login/login_content.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 126, 98, 202),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          final response = state.response;
          if (response is ErrorData) {
            Fluttertoast.showToast(
              msg: response.message,
              toastLength: Toast.LENGTH_SHORT,
            );
          } else if (response is Success) {
            final authResponse = response.data as AuthResponse;
            context.read<LoginBloc>().add(SaveUserSession(authResponse: authResponse));
            context.go('/client');
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return LoginContent(state: state);
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myway_app/src/domain/utils/resource.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:myway_app/src/presentation/utils/bloc_form_item.dart';
import 'package:myway_app/src/presentation/widgets/widgets.dart';

class LoginContent extends StatelessWidget {
  final LoginState state;
  const LoginContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final response = state.response;
    return Form(
      key: state.formKey,
      child: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 98, 48, 238),
                  Color.fromARGB(255, 74, 47, 146),
                ],
              ),
            ),
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _textRotated(
                  context,
                  () => context.push('/login'),
                  'Login',
                  26,
                  FontWeight.bold,
                ),
                SizedBox(height: 60),
                _textRotated(
                  context,
                  () => context.push('/register'),
                  'Register',
                  23,
                  FontWeight.normal,
                ),
                SizedBox(height: size.height * 0.25),
              ],
            ),
          ),
          // Pantalla login
          Container(
            margin: EdgeInsets.only(left: 60, bottom: 40),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 121, 78, 241),
                  Color.fromARGB(255, 144, 111, 235),
                ],
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _textTitles('Welcome', 30),
                      _textTitles('back...', 30),
                      _imageCar(),
                      _textTitles('Login', 24),
                      SizedBox(height: 50),
                      // Email
                      CustomTextField(
                        label: 'Email',
                        icon: Icons.email_outlined,
                        onChanged: (value) {
                          context.read<LoginBloc>().add(
                            EmailChanged(email: BlocFormItem(value: value)),
                          );
                        },
                        validator: (value) {
                          return state.email.error;
                        },
                      ),
                      SizedBox(height: 20),
                      // Password
                      CustomTextField(
                        label: 'Password',
                        icon: Icons.lock_outline_rounded,
                        onChanged: (value) {
                          context.read<LoginBloc>().add(
                            PasswordChanged(
                              password: BlocFormItem(value: value),
                            ),
                          );
                        },
                        validator: (value) {
                          return state.password.error;
                        },
                      ),
                      (response is LoadingData)
                          ? Container(
                            width: size.width,
                            height: 50,
                            margin: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 10,
                            ),
                            child: Center(
                              child: CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.white,),
                            ),
                          )
                          : CustomButton(
                            width: size.width,
                            label: 'Login',
                            margin: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 10,
                            ),
                            onPressed: () {
                              if (state.formKey!.currentState!.validate()) {
                                context.read<LoginBloc>().add(FormSubmit());
                              } else {
                                print('El formulario no es valido');
                              }
                            },
                          ),
                      SizedBox(height: 20),
                      _textDontHaveAccount(context),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _textDontHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No tienes cuenta?', style: TextStyle(color: Colors.grey[100])),
        SizedBox(width: 5),
        GestureDetector(
          onTap: () => context.push('/register'),
          child: Text(
            'Registrate',
            style: TextStyle(
              color: Colors.grey[100],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Container _imageCar() {
    return Container(
      alignment: Alignment.centerRight,
      child: Image.asset(
        'assets/images/car_white.png',
        width: 150,
        height: 150,
      ),
    );
  }

  Text _textTitles(String label, double fontSize) {
    return Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  GestureDetector _textRotated(
    BuildContext context,
    Function()? onTap,
    String label,
    double size,
    FontWeight weight,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: size,
            fontWeight: weight,
          ),
        ),
      ),
    );
  }
}

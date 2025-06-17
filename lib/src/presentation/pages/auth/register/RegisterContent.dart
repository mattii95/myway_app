import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myway_app/src/presentation/pages/auth/register/bloc/register_bloc.dart';
import 'package:myway_app/src/presentation/utils/BlocFormItem.dart';
import 'package:myway_app/src/presentation/widgets/widgets.dart';

class RegisterContent extends StatelessWidget {
  final RegisterState state;
  const RegisterContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: state.formKey,
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
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
                  () => Navigator.pop(context, 'login'),
                  'Login',
                  26,
                  FontWeight.normal,
                ),
                SizedBox(height: 60),
                _textRotated(
                  context,
                  () => Navigator.pop(context, 'register'),
                  'Register',
                  23,
                  FontWeight.bold,
                ),
                SizedBox(height: size.height * 0.25),
              ],
            ),
          ),
          // Register
          Container(
            margin: EdgeInsets.only(left: 60, bottom: 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                _imageBackground(size.width * 0.6, size.height * 0.4),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      _imageBanner(),
                      SizedBox(height: 20),
                      CustomTextFieldOutline(
                        label: 'Name',
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(
                            NameChanged(formItem: BlocFormItem(value: value)),
                          );
                        },
                        icon: Icons.person_outline,
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        validator: (value) {
                          return state.name.error;
                        },
                      ),
                      CustomTextFieldOutline(
                        label: 'Surname',
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(
                            SurnameChanged(formItem: BlocFormItem(value: value)),
                          );
                        },
                        icon: Icons.person_2_outlined,
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        validator: (value) {
                          return state.surname.error;
                        },
                      ),
                      CustomTextFieldOutline(
                        label: 'Number Phone',
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(
                            PhoneNumberChanged(
                              formItem: BlocFormItem(value: value),
                            ),
                          );
                        },
                        icon: Icons.phone_android_outlined,
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        validator: (value) {
                          return state.phoneNumber.error;
                        },
                      ),
                      CustomTextFieldOutline(
                        label: 'Email',
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(
                            EmailChanged(formItem: BlocFormItem(value: value)),
                          );
                        },
                        icon: Icons.email_outlined,
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        validator: (value) {
                          return state.email.error;
                        },
                      ),
                      CustomTextFieldOutline(
                        label: 'Password',
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(
                            PasswordChanged(formItem: BlocFormItem(value: value)),
                          );
                        },
                        icon: Icons.password_outlined,
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        validator: (value) {
                          return state.password.error;
                        },
                      ),
                      CustomTextFieldOutline(
                        label: 'Repeat Password',
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(
                            RepeatPassowrdChanged(
                              formItem: BlocFormItem(value: value),
                            ),
                          );
                        },
                        icon: Icons.password_outlined,
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        validator: (value) {
                          return state.repeatPassword.error;
                        },
                      ),
                      CustomButton(
                        width: size.width,
                        label: 'Register',
                        backgroundColor: Colors.deepPurple,
                        textColor: Colors.white,
                        margin: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                        onPressed: () {
                          if (state.formKey!.currentState!.validate()) {
                            context.read<RegisterBloc>().add(FormSubmit());
                            context.read<RegisterBloc>().add(FormReset());
                          }
                        },
                      ),
                      _textAlreadyHaveAccount(context),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _imageBanner() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/location_blue.png',
        width: 150,
        height: 150,
      ),
    );
  }

  Container _imageBackground(double width, double height) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        'assets/images/destination.png',
        width: width,
        height: height,
        opacity: AlwaysStoppedAnimation(0.1),
      ),
    );
  }

  Row _textAlreadyHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Tienes una cuenta?', style: TextStyle(color: Colors.grey)),
        SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            Navigator.pop(context, 'login');
          },
          child: Text(
            'Inicia Sesión',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ],
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

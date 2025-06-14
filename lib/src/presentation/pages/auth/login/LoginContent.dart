import 'package:flutter/material.dart';
import 'package:myway_app/src/presentation/widgets/widgets.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
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
                () => Navigator.pushNamed(context, 'login'),
                'Login',
                26,
                FontWeight.bold,
              ),
              SizedBox(height: 60),
              _textRotated(
                context,
                () => Navigator.pushNamed(context, 'register'),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textTitles('Welcome', 30),
                  _textTitles('back...', 30),
                  _imageCar(),
                  _textTitles('Login', 24),
                  SizedBox(height: 50),
                  // Email
                  CustomTextField(label: 'Email', icon: Icons.email_outlined),
                  SizedBox(height: 20),
                  // Password
                  CustomTextField(
                    label: 'Password',
                    icon: Icons.lock_outline_rounded,
                  ),
                  CustomButton(
                    width: size.width,
                    label: 'Login',
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  ),
                  SizedBox(height: 20),
                  _textDontHaveAccount(context),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _textDontHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No tienes cuenta?', style: TextStyle(color: Colors.grey[100])),
        SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'register');
          },
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

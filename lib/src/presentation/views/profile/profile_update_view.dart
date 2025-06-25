import 'package:flutter/material.dart';
import 'package:myway_app/src/presentation/widgets/custom_icon_back.dart';
import 'package:myway_app/src/presentation/widgets/widgets.dart';

class ProfileUpdateView extends StatelessWidget {
  const ProfileUpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          children: [
            _headerProfile(size),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: ElevatedButton.icon(
                onPressed: () {},
                label: Text('Guardar Cambios'),
                icon: Icon(Icons.save_as_outlined),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  iconColor: Colors.white,
                  elevation: 1,
                ),
              ),
            ),
            SizedBox(height: 35),
          ],
        ),
        _cardUserInfo(size),
        CustomIconBack(margin: EdgeInsets.all(10),),
      ],
    );
  }

  Widget _cardUserInfo(Size size) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 90),
      width: size.width,
      height: size.height * 0.5,
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              width: 145,
              height: 145,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/no-image.png',
                    image:
                        'https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 1),
                  ),
                ),
              ),
            ),
            CustomTextFieldOutline(
              label: 'Nombre',
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              onChanged: (p0) {},
              icon: Icons.person_outline,
            ),
            CustomTextFieldOutline(
              label: 'Apellido',
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              onChanged: (p0) {},
              icon: Icons.person_outline,
            ),
            CustomTextFieldOutline(
              label: 'Email',
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              onChanged: (p0) {},
              icon: Icons.email_outlined,
            ),
          ],
        ),
      ),
    );
  }

  Container _headerProfile(Size size) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 20),
      height: size.height * 0.3,
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
      child: Text(
        'Actualizar Perfil',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
    );
  }
}

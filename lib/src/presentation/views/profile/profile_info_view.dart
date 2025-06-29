import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myway_app/src/domain/models/user.dart';

class ProfileInfoView extends StatelessWidget {
  final User? user;
  const ProfileInfoView({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          children: [
            _headerProfile(size),
            Spacer(),
            _actionProfile('Editar Perfil', Icons.edit, () => context.push('/profile/update')),
            _actionProfile('Cerrar Sesión', Icons.settings_power_outlined, null),
            SizedBox(height: 35),
          ],
        ),
        _cardUserInfo(size),
      ],
    );
  }

  Widget _cardUserInfo(Size size) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 90),
      width: size.width,
      height: 260,
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
            Text(
              '${user?.name}${user?.surname}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(user?.email ?? '', style: TextStyle(color: Colors.grey[700])),
            Text(user?.phone ?? '', style: TextStyle(color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }

  Widget _actionProfile(String optionName, IconData icon, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: ListTile(
          title: Text(optionName, style: TextStyle(fontWeight: FontWeight.bold)),
          leading: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: Icon(icon, color: Colors.white),
          ),
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
        'Perfil de Usuario',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
    );
  }
}

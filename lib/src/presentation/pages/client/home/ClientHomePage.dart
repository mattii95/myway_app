import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myway_app/src/presentation/pages/client/home/bloc/client_home_bloc.dart';
import 'package:myway_app/src/presentation/utils/MenuItems.dart';
import 'package:myway_app/src/presentation/widgets/SideMenu.dart';

class ClientHomePage extends StatefulWidget {
  final Widget childView;
  const ClientHomePage({super.key, required this.childView});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  final menuItems = <MenuItem>[
    MenuItem(
      title: 'Perfil',
      subTitle: 'Perfil de usuario',
      link: '/profile',
      icon: Icons.person_off_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientHomeBloc, ClientHomeState>(
      builder: (context, state) {
        return Scaffold(
          key: state.scaffoldKey,
          appBar: AppBar(title: Text('Menu')),
          body: widget.childView,
          drawer: SideMenu(
            menuItems: menuItems,
            scaffoldKey: state.scaffoldKey!,
          ),
        );
      },
    );
  }
}

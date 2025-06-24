import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myway_app/src/presentation/pages/client/home/bloc/client_home_bloc.dart';
import 'package:myway_app/src/presentation/utils/menu_items.dart';

class SideMenu extends StatefulWidget {
  final List<MenuItem> menuItems;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key,
    required this.menuItems,
    required this.scaffoldKey,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        navDrawerIndex = value;
        final isValidIndex = value >= 0 && value < widget.menuItems.length;
        if (isValidIndex) {
          final menuItem = widget.menuItems[value];
          context.push(menuItem.link);
        } else {
          context.read<ClientHomeBloc>().add(Logout());
          context.go('/login');
        }
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        DrawerHeader(child: Text('Opciones')),
        ...widget.menuItems.map(
          (item) => NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.logout_outlined),
          label: Text('Cerrar Sesion'),
        ),
      ],
    );
  }
}

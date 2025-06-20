import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myway_app/src/presentation/utils/MenuItems.dart';

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
        final menuItem = widget.menuItems[value];
        context.push(menuItem.link);
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
      ],
    );
  }
}

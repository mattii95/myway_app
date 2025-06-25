import 'package:flutter/material.dart';
import 'package:myway_app/src/presentation/views/profile/profile_update_view.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: ProfileUpdateView()));
  }
}

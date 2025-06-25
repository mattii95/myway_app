import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myway_app/src/presentation/pages/profile/info/bloc/profile_info_bloc.dart';
import 'package:myway_app/src/presentation/views/profile/profile_info_view.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileInfoBloc, ProfileInfoState>(
        builder: (context, state) {
          return ProfileInfoView(user: state.user);
        },
      ),
    );
  }
}

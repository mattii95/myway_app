import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myway_app/src/domain/models/auth_response.dart';
import 'package:myway_app/src/domain/models/user.dart';
import 'package:myway_app/src/domain/use-cases/auth/auth_use_case.dart';

part 'profile_info_event.dart';
part 'profile_info_state.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  AuthUseCases authUseCases;

  ProfileInfoBloc(this.authUseCases) : super(ProfileInfoInitial()) {
    on<GetUserInfo>((event, emit) async {
      AuthResponse authResponse =
          await authUseCases.getUserSessionUseCase.run();
      emit(state.copyWith(user: authResponse.user));
    });
  }
}

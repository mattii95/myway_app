import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myway_app/src/domain/use-cases/auth/auth_use_case.dart';

part 'client_home_event.dart';
part 'client_home_state.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {
  AuthUseCases authUseCases;

  ClientHomeBloc(this.authUseCases)
    : super(
        ClientHomeState(pageIndex: 0, scaffoldKey: GlobalKey<ScaffoldState>()),
      ) {
    on<ChangeDrawerPage>((event, emit) {
      emit(
        state.copyWith(scaffoldKey: state.scaffoldKey, pageIndex: event.pageIndex),
      );
    });

    on<Logout>((event, emit) async{
      await authUseCases.logoutUseCase.run();
    });
  }
}

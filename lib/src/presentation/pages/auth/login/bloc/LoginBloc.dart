import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myway_app/src/data/datasource/remote/services/AuthService.dart';
import 'package:myway_app/src/domain/utils/Resource.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:myway_app/src/presentation/utils/BlocFormItem.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  LoginBloc() : super(LoginState()) {
    on<LoginInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<EmailChanged>((event, emit) {
      emit(
        state.copyWith(
          email: BlocFormItem(
            value: event.email.value,
            error: event.email.value.isEmpty ? 'Ingresa un Email' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<PasswordChanged>((event, emit) {
      emit(
        state.copyWith(
          password: BlocFormItem(
            value: event.password.value,
            error:
                event.password.value.isEmpty ? 'Ingresa una Contraseña' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<FormSubmit>((event, emit) async {
      emit(state.copyWith(response: LoadingData(), formKey: formKey));
      Resource response = await authService.login(
        state.email.value,
        state.password.value,
      );
      emit(state.copyWith(response: response, formKey: formKey));
    });
  }
}

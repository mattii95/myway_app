import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myway_app/src/domain/models/AuthResponse.dart';
import 'package:myway_app/src/domain/use-cases/auth/AuthUseCases.dart';
import 'package:myway_app/src/domain/utils/Resource.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:myway_app/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:myway_app/src/presentation/utils/BlocFormItem.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthUseCases authUseCases;
  final formKey = GlobalKey<FormState>();

  LoginBloc(this.authUseCases) : super(LoginState()) {
    on<LoginInitEvent>((event, emit) async {
      AuthResponse? authResponse =
          await authUseCases.getUserSessionUseCase.run();
      emit(state.copyWith(formKey: formKey));
      if (authResponse != null) {
        emit(state.copyWith(formKey: formKey, response: Success(authResponse)));
      }
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
      Resource response = await authUseCases.loginUseCase.run(
        state.email.value,
        state.password.value,
      );
      emit(state.copyWith(response: response, formKey: formKey));
    });

    on<SaveUserSession>((event, emit) async {
      await authUseCases.saveUserSessionUseCase.run(event.authResponse);
    });

  }
}

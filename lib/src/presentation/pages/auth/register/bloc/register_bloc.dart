import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myway_app/src/domain/models/user.dart';
import 'package:myway_app/src/domain/use-cases/auth/auth_use_case.dart';
import 'package:myway_app/src/domain/utils/resource.dart';
import 'package:myway_app/src/presentation/utils/bloc_form_item.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthUseCases authUseCases;
  final formKey = GlobalKey<FormState>();

  RegisterBloc(this.authUseCases) : super(RegisterInitial()) {
    on<RegisterInitialEvent>(_registerInitialEvent);
    on<NameChanged>(_handleNameChanged);
    on<SurnameChanged>(_handleSurnameChanged);
    on<PhoneNumberChanged>(_handlePhoneNumberChanged);
    on<EmailChanged>(_handleEmailChanged);
    on<PasswordChanged>(_handlePasswordChanged);
    on<RepeatPassowrdChanged>(_handleRepeatPasswordChanged);
    on<FormSubmit>(_handleFormSubmit);
    on<FormReset>(_handleFormReset);
  }

  _registerInitialEvent(RegisterEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(formKey: formKey));
  }

  _handleNameChanged(NameChanged event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        formKey: formKey,
        name: BlocFormItem(
          value: event.formItem.value,
          error: event.formItem.value.isEmpty ? 'Ingresa el nombre' : null,
        ),
      ),
    );
  }

  _handleSurnameChanged(SurnameChanged event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        formKey: formKey,
        surname: BlocFormItem(
          value: event.formItem.value,
          error: event.formItem.value.isEmpty ? 'Ingresa el apellido' : null,
        ),
      ),
    );
  }

  _handlePhoneNumberChanged(
    PhoneNumberChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      state.copyWith(
        formKey: formKey,
        phoneNumber: BlocFormItem(
          value: event.formItem.value,
          error:
              event.formItem.value.isEmpty
                  ? 'Ingresa el numero de telefono'
                  : null,
        ),
      ),
    );
  }

  _handleEmailChanged(EmailChanged event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        formKey: formKey,
        email: BlocFormItem(
          value: event.formItem.value,
          error: event.formItem.value.isEmpty ? 'Ingresa el email' : null,
        ),
      ),
    );
  }

  _handlePasswordChanged(PasswordChanged event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        formKey: formKey,
        password: BlocFormItem(
          value: event.formItem.value,
          error:
              event.formItem.value.isEmpty
                  ? 'Ingresa la contraseña'
                  : event.formItem.value.length < 6
                  ? 'Minimo 6 caracteres'
                  : null,
        ),
      ),
    );
  }

  _handleRepeatPasswordChanged(
    RepeatPassowrdChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      state.copyWith(
        formKey: formKey,
        repeatPassword: BlocFormItem(
          value: event.formItem.value,
          error:
              event.formItem.value.isEmpty
                  ? 'Ingresa la contraseña'
                  : event.formItem.value.length < 6
                  ? 'Minimo 6 caracteres'
                  : event.formItem.value != state.password.value
                  ? 'Las contraseñas no coinciden'
                  : null,
        ),
      ),
    );
  }

  _handleFormSubmit(FormSubmit event, Emitter<RegisterState> emit) async {
    final msg = '''
      - Name: ${state.name.value}
      - Surname: ${state.surname.value}
      - Phone: ${state.phoneNumber.value}
      - Email: ${state.email.value}
      - Password: ${state.password.value}
      - Repeat Password: ${state.repeatPassword.value}
    ''';
    print(msg);

    emit(state.copyWith(response: LoadingData(), formKey: formKey));

    Resource response = await authUseCases.registerUseCase.run(state.toUser());

    emit(state.copyWith(response: response, formKey: formKey));
  }

  _handleFormReset(FormReset event, Emitter<RegisterState> emit) {
    state.formKey?.currentState?.reset();
  }
}

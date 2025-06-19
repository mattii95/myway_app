part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem surname;
  final BlocFormItem phoneNumber;
  final BlocFormItem email;
  final BlocFormItem password;
  final BlocFormItem repeatPassword;
  final Resource? response;
  final GlobalKey<FormState>? formKey;

  const RegisterState({
    this.name = const BlocFormItem(error: 'Ingresa el nombre'),
    this.surname = const BlocFormItem(error: 'Ingresa el apellido'),
    this.phoneNumber = const BlocFormItem(
      error: 'Ingresa el numero de telefono',
    ),
    this.email = const BlocFormItem(error: 'Ingresa el email'),
    this.password = const BlocFormItem(error: 'Ingresa la contraseña'),
    this.repeatPassword = const BlocFormItem(error: 'Confirma la contraseña'),
    this.response,
    this.formKey,
  });

  User toUser() => User(
    name: name.value,
    surname: surname.value,
    phone: phoneNumber.value,
    email: email.value,
    password: password.value,
    rolesTypes: ['client'],
  );

  RegisterState copyWith({
    BlocFormItem? name,
    BlocFormItem? surname,
    BlocFormItem? phoneNumber,
    BlocFormItem? email,
    BlocFormItem? password,
    BlocFormItem? repeatPassword,
    Resource? response,
    GlobalKey<FormState>? formKey,
  }) => RegisterState(
    name: name ?? this.name,
    surname: surname ?? this.surname,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    email: email ?? this.email,
    password: password ?? this.password,
    repeatPassword: repeatPassword ?? this.repeatPassword,
    response: response,
    formKey: formKey,
  );

  @override
  List<Object?> get props => [
    name,
    surname,
    phoneNumber,
    email,
    password,
    repeatPassword,
    response,
  ];
}

final class RegisterInitial extends RegisterState {}

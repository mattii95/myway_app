import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myway_app/src/presentation/utils/BlocFormItem.dart';

class LoginState extends Equatable {
  final BlocFormItem email;
  final BlocFormItem password;
  final GlobalKey<FormState>? formKey;

  const LoginState({this.email = const BlocFormItem(error: 'Ingresa el Email'), this.password = const BlocFormItem(error: 'Ingresa una contraseña'), this.formKey});

  LoginState copyWith({
    BlocFormItem? email,
    BlocFormItem? password,
    GlobalKey<FormState>? formKey,
  }) => LoginState(
    email: email ?? this.email,
    password: password ?? this.password,
    formKey: formKey
  );

  @override
  List<Object?> get props => [email, password];
}

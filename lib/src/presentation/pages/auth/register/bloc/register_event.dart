part of 'register_bloc.dart';

abstract class RegisterEvent {}

class RegisterInitialEvent extends RegisterEvent {}

class NameChanged extends RegisterEvent {
  final BlocFormItem formItem;
  NameChanged({required this.formItem});
}

class SurnameChanged extends RegisterEvent {
  final BlocFormItem formItem;
  SurnameChanged({required this.formItem});
}

class EmailChanged extends RegisterEvent {
  final BlocFormItem formItem;
  EmailChanged({required this.formItem});
}

class PhoneNumberChanged extends RegisterEvent {
  final BlocFormItem formItem;
  PhoneNumberChanged({required this.formItem});
}

class PasswordChanged extends RegisterEvent {
  final BlocFormItem formItem;
  PasswordChanged({required this.formItem});
}

class RepeatPassowrdChanged extends RegisterEvent {
  final BlocFormItem formItem;
  RepeatPassowrdChanged({required this.formItem});
}

class FormSubmit extends RegisterEvent {}

class FormReset extends RegisterEvent {}

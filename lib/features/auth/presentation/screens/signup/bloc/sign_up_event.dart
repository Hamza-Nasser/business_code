part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

final class EmailChanged extends SignUpEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

final class PasswordChanged extends SignUpEvent {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

final class ConfirmPasswordChanged extends SignUpEvent {
  const ConfirmPasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

final class ChangeCurrentStep extends SignUpEvent {
  const ChangeCurrentStep({required this.currentStep});

  final SignUpStep currentStep;

  @override
  List<Object> get props => [currentStep];
}

final class ChangeDialCode extends SignUpEvent {
  const ChangeDialCode({required this.dialCode});

  final String dialCode;

  @override
  List<Object> get props => [dialCode];
}

final class ChangeFullName extends SignUpEvent {
  const ChangeFullName({required this.fullName});

  final String fullName;

  @override
  List<Object> get props => [fullName];
}

final class ChangeJobTitle extends SignUpEvent {
  const ChangeJobTitle({required this.jobTitle});

  final String jobTitle;

  @override
  List<Object> get props => [jobTitle];
}

final class ChangeLocalPhoneNumber extends SignUpEvent {
  const ChangeLocalPhoneNumber({required this.phoneNumber});

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

final class SignUp extends SignUpEvent {}

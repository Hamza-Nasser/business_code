part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

final class EmailChanged extends SignInEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

final class EmailUnfocused extends SignInEvent {}

final class PasswordChanged extends SignInEvent {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

final class PasswordUnfocused extends SignInEvent {}

final class FormSubmitted extends SignInEvent {}

final class SignInWithGoogle extends SignInEvent {}

final class SignInWithFacebook extends SignInEvent {}

final class SignInWithApple extends SignInEvent {}

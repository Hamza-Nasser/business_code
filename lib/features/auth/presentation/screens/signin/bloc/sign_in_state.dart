part of 'sign_in_bloc.dart';

enum SocialSignInStatus { initial, loading, success, failure }

final class SignInState extends Equatable {
  const SignInState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
  });
  final Email email;
  final Password password;
  final bool isValid;
  final FormzSubmissionStatus status;

  SignInState copyWith({
    Email? email,
    Password? password,
    bool? isValid,
    FormzSubmissionStatus? status,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
    );
  }

  @override
  String toString() =>
      'SignUpState(email: ${email.value}, password: ${password.value}, status: $status)';

  @override
  List<Object?> get props => [email, password, status];
}

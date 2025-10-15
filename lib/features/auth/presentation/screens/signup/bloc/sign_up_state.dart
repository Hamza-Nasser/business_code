part of 'sign_up_bloc.dart';

enum SignUpStep { first, second }

enum SignUpStatus { initial, loading, success, failure }

class SignUpState extends Equatable {
  const SignUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const Password.pure(),
    this.fullName = const GeneralText.pure(),
    this.jobTitle = const GeneralText.pure(),
    this.currentStep = SignUpStep.first,
    this.status = SignUpStatus.initial,
  });

  bool get passwordsMatch => password.value == confirmPassword.value;

  final Email email;
  final Password password;
  final Password confirmPassword;
  final GeneralText fullName;
  final GeneralText jobTitle;
  final SignUpStep currentStep;
  final SignUpStatus status;

  SignUpState copyWith({
    Email? email,
    Password? password,
    Password? confirmPassword,
    GeneralText? fullName,
    GeneralText? jobTitle,
    SignUpStep? currentStep,
    SignUpStatus? status,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      fullName: fullName ?? this.fullName,
      jobTitle: jobTitle ?? this.jobTitle,
      currentStep: currentStep ?? this.currentStep,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
    email,
    password,
    confirmPassword,
    currentStep,
    fullName,
    jobTitle,
    status,
  ];
}

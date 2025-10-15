import 'package:bloc/bloc.dart';
import 'package:business_code/core/validators/email.dart';
import 'package:business_code/core/validators/general_text.dart';
import 'package:business_code/core/validators/password.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<ChangeCurrentStep>(_onChangeCurrentStep);
    on<ChangeFullName>(_onChangeFullName);
    on<ChangeJobTitle>(_onChangeJobTitle);
    on<SignUp>(_onSignUp);
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignUpState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(email: email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SignUpState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(password: password));
  }

  void _onConfirmPasswordChanged(
    ConfirmPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(confirmPassword: password));
  }

  void _onChangeCurrentStep(
    ChangeCurrentStep event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(currentStep: event.currentStep));
  }

 

  void _onChangeFullName(ChangeFullName event, Emitter<SignUpState> emit) {
    final fullName = GeneralText.dirty(event.fullName);
    emit(state.copyWith(fullName: fullName));
  }

  void _onChangeJobTitle(ChangeJobTitle event, Emitter<SignUpState> emit) {
    final jobTitle = GeneralText.dirty(event.jobTitle);
    emit(state.copyWith(jobTitle: jobTitle));
  }

  void _onSignUp(SignUp event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(status: SignUpStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(status: SignUpStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SignUpStatus.failure));
    }
  }
}

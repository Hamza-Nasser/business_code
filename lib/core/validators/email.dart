import 'package:business_code/generated/l10n.dart';
import 'package:formz/formz.dart';

enum EmailValidationError {
  invalid;

  @override
  String toString() {
    return switch (this) {
      EmailValidationError.invalid => S.current.invalidEmail,
    };
  }
}

final class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure([super.value = '']) : super.pure();
  const Email.dirty([super.value = '']) : super.dirty();

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  /// Returns null if [value] is valid, otherwise returns [EmailValidationError.invalid]
  /// This overrides the default validator in FormzInput, which affects the [isValid] getter
  @override
  EmailValidationError? validator(String? value) {
    return _emailRegex.hasMatch(value ?? '')
        ? null
        : EmailValidationError.invalid;
  }
}

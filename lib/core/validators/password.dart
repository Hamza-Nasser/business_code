import 'package:business_code/generated/l10n.dart';
import 'package:formz/formz.dart';

enum PasswordValidationError {
  invalid,
  empty,
  short;

  @override
  String toString() {
    return switch (this) {
      PasswordValidationError.empty => S.current.passwordCannotBeEmpty,
      PasswordValidationError.short => S.current.passwordTooShort,
      PasswordValidationError.invalid => S.current.passwordInvalid,
    };
  }
}

final class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([super.value = '']) : super.pure();
  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegex = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );
  static const _passwordMinLength = 8;

  @override
  PasswordValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PasswordValidationError.empty;
    }
    if (value.length < _passwordMinLength) {
      return PasswordValidationError.short;
    }
    return _passwordRegex.hasMatch(value)
        ? null
        : PasswordValidationError.invalid;
  }
}

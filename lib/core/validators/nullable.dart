import 'package:formz/formz.dart';

enum NonNullableValidationError { invalid }

class NonNullable<T> extends FormzInput<T?, NonNullableValidationError> {
  const NonNullable.pure([super.value]) : super.pure();
  const NonNullable.dirty([super.value]) : super.dirty();

  /// Returns null if [value] is valid, otherwise returns [EmailValidationError.invalid]
  /// This overrides the default validator in FormzInput, which affects the [isValid] getter
  @override
  NonNullableValidationError? validator(T? value) {
    return value != null ? null : NonNullableValidationError.invalid;
  }
}

enum NullableValidationError { invalid }

class Nullable<T> extends FormzInput<T?, NullableValidationError> {
  const Nullable.pure([super.value]) : super.pure();
  const Nullable.dirty([super.value]) : super.dirty();

  /// Returns null if [value] is valid, otherwise returns [EmailValidationError.invalid]
  /// This overrides the default validator in FormzInput, which affects the [isValid] getter
  @override
  NullableValidationError? validator(T? value) {
    return null;
  }
}

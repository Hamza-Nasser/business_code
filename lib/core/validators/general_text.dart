import 'package:formz/formz.dart';

enum GeneralTextValidationError { invalid }

final class GeneralText extends FormzInput<String, GeneralTextValidationError> {
  const GeneralText.pure([super.value = '']) : super.pure();
  const GeneralText.dirty([super.value = '']) : super.dirty();

  /// Returns null if [value] is valid, otherwise returns [GeneralTextValidationError.invalid]
  /// This overrides the default validator in FormzInput, which affects the [isValid] getter
  @override
  GeneralTextValidationError? validator(String? value) {
    return value != null && value.isNotEmpty
        ? null
        : GeneralTextValidationError.invalid;
  }
}

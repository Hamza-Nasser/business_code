import 'package:business_code/core/validators/identifier_type_enum.dart';
import 'package:formz/formz.dart';

enum IdentifierValidationError { invalid }

const String emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

final class Identifier extends FormzInput<String, IdentifierValidationError> {
  const Identifier.pure([super.value = '']) : super.pure();
  const Identifier.dirty([super.value = '']) : super.dirty();

  static final _emailRegex = RegExp(emailRegex);

  /// Returns null if [value] is valid, otherwise returns [IdentifierValidationError.invalid]
  /// This overrides the default validator in FormzInput, which affects the [isValid] getter

  @override
  IdentifierValidationError? validator(String value) {
    return _emailRegex.hasMatch(value)
        ? null
        : IdentifierValidationError.invalid;
  }

  IdentifierType get type {
    if (_emailRegex.hasMatch(value)) {
      return IdentifierType.email;
    }
    throw UnimplementedError('Identifier type not supported');
  }
}

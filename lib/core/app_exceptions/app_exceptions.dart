import 'package:equatable/equatable.dart';

// Any exception that occurs in the app should extend this class
abstract class AppException extends Equatable implements Exception {
  final String? message;

  const AppException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

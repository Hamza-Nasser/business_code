import 'package:equatable/equatable.dart';

final class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String? phone;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? webLink,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object?> get props => [id, name, email, phone];
}

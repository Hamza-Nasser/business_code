import 'package:equatable/equatable.dart';

class UserDBKeys {
  UserDBKeys._();

  // Key Name
  static const String key = 'User';
  // values
  static const String id = 'id';
  static const String name = 'name';
  static const String email = 'email';
  static const String phone = 'phone';
}

final class UserDto extends Equatable {
  final int id;
  final String name;
  final String email;
  final String? phone;

  const UserDto({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  UserDto copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? webLink,
  }) {
    return UserDto(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  static Map<String, dynamic> toDatabaseMap(UserDto user) {
    return {
      UserDBKeys.id: user.id,
      UserDBKeys.name: user.name,
      UserDBKeys.email: user.email,
      UserDBKeys.phone: user.phone,
    };
  }

  factory UserDto.fromDatabaseMap(Map<String, dynamic> map) {
    return UserDto(
      id: map[UserDBKeys.id],
      name: map[UserDBKeys.name],
      email: map[UserDBKeys.email],
      phone: map[UserDBKeys.phone],
    );
  }

  @override
  List<Object?> get props => [id, name, email, phone];
}

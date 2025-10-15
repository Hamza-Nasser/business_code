import 'package:business_code/features/auth/data/dtos/user_dto.dart';
import 'package:business_code/features/auth/domain/entities/user.dart'
    as domain;
import 'package:injectable/injectable.dart';

@Injectable()
final class UserDtoMapper {
  const UserDtoMapper();

  domain.User toDomain(UserDto dto) {
    return domain.User(
      id: dto.id,
      name: dto.name,
      email: dto.email,
      phone: dto.phone,
    );
  }

  UserDto toDto(domain.User user) {
    return UserDto(
      id: user.id,
      name: user.name,
      email: user.email,
      phone: user.phone,
    );
  }

  Map<String, dynamic> toDatabaseMap(domain.User user) {
    return UserDto.toDatabaseMap(toDto(user));
  }

  domain.User fromDatabaseMap(Map<String, dynamic> map) {
    return toDomain(UserDto.fromDatabaseMap(map));
  }
}

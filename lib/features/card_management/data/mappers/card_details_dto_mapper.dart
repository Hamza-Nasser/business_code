import 'package:business_code/features/card_management/data/dto/card_details_dto.dart';
import 'package:business_code/features/card_management/domain/entities/card_details.dart';
import 'package:injectable/injectable.dart';


@Injectable()
final class CardDetailsDtoMapper {

  CardDetails toDomain(CardDetailsDto dto) {
    return CardDetails(
      id: dto.id,
      title: dto.title,
      subtitle: dto.subtitle,
      location: dto.location,
      email: dto.email,
      extras: dto.extras,
    );
  }

  CardDetailsDto fromDomain(CardDetails domain) {
    return CardDetailsDto(
      id: domain.id,
      title: domain.title,
      subtitle: domain.subtitle,
      location: domain.location,
      email: domain.email,
      extras: domain.extras,
    );
  }
}

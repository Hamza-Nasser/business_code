import 'package:json_annotation/json_annotation.dart';

part 'card_details_dto.g.dart';

@JsonSerializable()
final class CardDetailsDto {
  final String id;
  final String title;
  final String subtitle;
  final String location;
  final String email;
  final List<String> extras;

  const CardDetailsDto({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.location,
    required this.email,
    required this.extras,
  });

  factory CardDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$CardDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CardDetailsDtoToJson(this);
}

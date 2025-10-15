// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardDetailsDto _$CardDetailsDtoFromJson(Map<String, dynamic> json) =>
    CardDetailsDto(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      location: json['location'] as String,
      email: json['email'] as String,
      extras: (json['extras'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CardDetailsDtoToJson(CardDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'location': instance.location,
      'email': instance.email,
      'extras': instance.extras,
    };

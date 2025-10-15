import 'package:equatable/equatable.dart';

final class CardDetails extends Equatable {
  const CardDetails({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.location,
    required this.email,
    required this.extras,
  });

  final String id;
  final String title;
  final String subtitle;
  final String location;
  final String email;
  final List<String> extras;

  @override
  List<Object> get props => [id, title, subtitle, location, email, extras];
}

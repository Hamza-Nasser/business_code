part of 'localization_bloc.dart';

sealed class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object> get props => [];
}

final class InitLocal extends LocalizationEvent {
  const InitLocal();
}

final class ChangeLocal extends LocalizationEvent {
  const ChangeLocal({required this.locale});

  final Locale locale;

  @override
  List<Object> get props => [locale];
}

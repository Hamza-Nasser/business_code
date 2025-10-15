part of 'localization_bloc.dart';

class LocalizationState extends Equatable {
  const LocalizationState({this.currentLocale = const Locale('en')});

  final Locale currentLocale;

  LocalizationState copyWith({Locale? currentLocale}) {
    return LocalizationState(currentLocale: currentLocale ?? this.currentLocale);
  }

  @override
  List<Object> get props => [currentLocale];
}

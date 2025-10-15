import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:business_code/core/services/prefs/prefs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationState()) {
    on<InitLocal>(_onInitLocal);
    on<ChangeLocal>(_onChangeLocal);
  }

  void _onInitLocal(InitLocal event, Emitter<LocalizationState> emit) {
    final locale = PreferenceUtils.getString(PreferencesKey.locale, 'en');
    final localeCode = (locale.isEmpty) ? 'en' : locale;
    emit(state.copyWith(currentLocale: Locale(localeCode)));
  }

  void _onChangeLocal(ChangeLocal event, Emitter<LocalizationState> emit) {
    unawaited(
      PreferenceUtils.setString(
        PreferencesKey.locale,
        event.locale.languageCode,
      ),
    );
    emit(state.copyWith(currentLocale: event.locale));
  }
}

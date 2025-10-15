import 'package:bloc/bloc.dart';
import 'package:business_code/core/services/prefs/prefs.dart';
import 'package:equatable/equatable.dart';

part 'starter_screen_event.dart';
part 'starter_screen_state.dart';

class StarterScreenBloc extends Bloc<StarterScreenEvent, StarterScreenState> {
  StarterScreenBloc._internal() : super(const StarterScreenState()) {
    on<DecideWhereToGoEvent>(_onDecideWhereToGo);
  }
  static final StarterScreenBloc _instance = StarterScreenBloc._internal();
  factory StarterScreenBloc() {
    return _instance;
  }

  void _onDecideWhereToGo(
    DecideWhereToGoEvent event,
    Emitter<StarterScreenState> emit,
  ) async {
    final isLoggedIn = PreferenceUtils.getBool(PreferencesKey.isLoggedIn);
    if (isLoggedIn) {
      emit(
        state.copyWith(screenStartDestination: StartScreenDestination.shell),
      );
      return;
    }
    final onboardingShown = PreferenceUtils.getBool(
      PreferencesKey.isOnboardingShown,
    );
    if (!onboardingShown) {
      emit(
        state.copyWith(screenStartDestination: StartScreenDestination.signIn),
      );
      return;
    }

    emit(state.copyWith(screenStartDestination: StartScreenDestination.signIn));
  }
}

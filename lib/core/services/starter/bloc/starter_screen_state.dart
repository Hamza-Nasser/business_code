part of 'starter_screen_bloc.dart';

enum StartScreenDestination { deciding, onboarding, signIn, shell }

class StarterScreenState extends Equatable {
  const StarterScreenState({
    this.screenStartDestination = StartScreenDestination.deciding,
  });
  final StartScreenDestination screenStartDestination;

  StarterScreenState copyWith({
    StartScreenDestination? screenStartDestination,
  }) {
    return StarterScreenState(
      screenStartDestination:
          screenStartDestination ?? this.screenStartDestination,
    );
  }

  @override
  List<Object> get props => [screenStartDestination];
}

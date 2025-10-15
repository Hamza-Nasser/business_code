part of 'starter_screen_bloc.dart';

sealed class StarterScreenEvent extends Equatable {
  const StarterScreenEvent();

  @override
  List<Object> get props => [];
}

final class DecideWhereToGoEvent extends StarterScreenEvent {
  const DecideWhereToGoEvent();
}
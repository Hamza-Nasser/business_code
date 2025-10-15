part of 'shell_bloc.dart';

sealed class ShellEvent extends Equatable {
  const ShellEvent();

  @override
  List<Object> get props => [];
}

class ShellTabChanged extends ShellEvent {
  const ShellTabChanged(this.tab);

  final ShellTab tab;

  @override
  List<Object> get props => [tab];
}

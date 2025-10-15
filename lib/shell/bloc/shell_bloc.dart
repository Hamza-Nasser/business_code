import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shell_event.dart';
part 'shell_state.dart';

class ShellBloc extends Bloc<ShellEvent, ShellState> {
  ShellBloc() : super(const ShellState()) {
    on<ShellTabChanged>(_onShellTabChanged);
  }

  void _onShellTabChanged(ShellTabChanged event, Emitter<ShellState> emit) {
    emit(state.copyWith(currentTab: event.tab));
  }
}

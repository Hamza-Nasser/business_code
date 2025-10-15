part of 'shell_bloc.dart';

enum ShellTab {
  listCards,
  analytics;

  @override
  String toString() {
    return switch (this) {
      ShellTab.listCards => 'List Cards',
      ShellTab.analytics => 'Analytics',
    };
  }
}

class ShellState extends Equatable {
  const ShellState({this.currentTab = ShellTab.listCards});
  final ShellTab currentTab;

  ShellState copyWith({ShellTab? currentTab}) {
    return ShellState(currentTab: currentTab ?? this.currentTab);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [currentTab];
}

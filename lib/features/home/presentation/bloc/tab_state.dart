part of 'tab_bloc.dart';

abstract class TabState extends Equatable {
  const TabState();

  @override
  List<Object> get props => [];
}

class TabInitial extends TabState {}

class TabLoaded extends TabState {
  final int tabIndex;

  const TabLoaded(this.tabIndex);

  @override
  List<Object> get props => [tabIndex];
}

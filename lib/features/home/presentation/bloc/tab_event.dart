part of 'tab_bloc.dart';

@immutable
sealed class TabEvent {}

final class TabChanged extends TabEvent {
  final int tabIndex;

  TabChanged({
    required this.tabIndex,
  });

// @override
// List<Object> get props => [tabIndex];
}

final class DefaultTab extends TabEvent {}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
part 'tab_event.dart';
part 'tab_state.dart';
class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabInitial());

  @override
  Stream<TabState> mapEventToState(TabEvent event) async* {
    if (event is TabChanged) {
      yield TabLoaded(event.tabIndex);
    }
  }
}

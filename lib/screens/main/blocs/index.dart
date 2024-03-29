import 'dart:async';
import 'package:bloc/bloc.dart';

abstract class MainEvent {}

class LoadingEvent extends MainEvent {}

class ChangePageMainEvent extends MainEvent {
  final int page;
  ChangePageMainEvent(this.page);
}

class IncrementPageMainEvent extends MainEvent {
  IncrementPageMainEvent();
}

class DoneHardChangePageMainEvent extends MainEvent {
  DoneHardChangePageMainEvent();
}

class DecrementPageMainEvent extends MainEvent {
  DecrementPageMainEvent();
}

class SetStoreVisibleMainEvent extends MainEvent {
  final bool visible;
  SetStoreVisibleMainEvent(this.visible);
}

class SetMBSheetVisibleMainEvent extends MainEvent {
  final bool visible;
  SetMBSheetVisibleMainEvent(this.visible);
}

class MainState {
  int page = 0;
  bool hardChange = false;
  bool loading = false;
  bool isStoreVisible = false;
  bool isMBSheetVisible = false;
  MainState();

  MainState copyWith({int page, bool isStoreVisible, bool isMBSheetVisible, bool hardChange}) {
    return MainState()
      ..page = page ?? this.page
      ..hardChange = hardChange ?? this.hardChange
      ..isStoreVisible = isStoreVisible ?? this.isStoreVisible
      ..isMBSheetVisible = isMBSheetVisible ?? this.isMBSheetVisible;
  }
}

class MainScreenBloc extends Bloc<MainEvent, MainState> {
  static MainScreenBloc _instance;
  static MainScreenBloc getInstance() {
    if (_instance == null) _instance = MainScreenBloc();
    return _instance;
  }

  MainState get initialState => MainState();
  String address;
  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    if (event is ChangePageMainEvent) yield currentState.copyWith(page: event.page);
    if (event is IncrementPageMainEvent)
      yield currentState.copyWith(
          page: currentState.page >= 3 ? currentState.page : currentState.page + 1, hardChange: true);
    if (event is DecrementPageMainEvent)
      yield currentState.copyWith(
          page: currentState.page <= 0 ? currentState.page : currentState.page - 1, hardChange: true);
    if (event is DoneHardChangePageMainEvent) yield currentState.copyWith(hardChange: false);
    if (event is SetStoreVisibleMainEvent)
      yield currentState.copyWith(isStoreVisible: event.visible, page: event.visible ? currentState.page : 1);
    if (event is SetMBSheetVisibleMainEvent) yield currentState.copyWith(isMBSheetVisible: event.visible);
  }
}

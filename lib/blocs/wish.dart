part of blocs;

abstract class WishEvent {}

class FetchWishEvent extends WishEvent {
  FetchWishEvent();
}

class WishState {
  List<Wish> wishes = [];
  LoadStatus loadStatus = LoadStatus.loaded;

  WishState();

  WishState copyWith({
    List<Wish> wishes,
    LoadStatus loadStatus,
  }) {
    return WishState()
      ..wishes = wishes ?? this.wishes
      ..loadStatus = loadStatus ?? this.loadStatus;
  }
}

class WishBloc extends Bloc<WishEvent, WishState> {
  static WishBloc _instance;
  static WishBloc getInstance() {
    if (_instance == null) _instance = WishBloc();
    return _instance;
  }

  @override
  WishState get initialState => WishState();
  NotificationBloc notificationBloc = NotificationBloc.getInstance();

  @override
  Stream<WishState> mapEventToState(WishEvent event) async* {
    if (event is FetchWishEvent) {
      yield currentState.copyWith(loadStatus: LoadStatus.loading);
      List<Wish> wishes = await WishApi.all();
      yield currentState.copyWith(wishes: wishes, loadStatus: LoadStatus.loaded);
    }
  }
}

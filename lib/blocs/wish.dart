part of blocs;

abstract class WishEvent {}

class FetchWishEvent extends WishEvent {
  FetchWishEvent();
}

class AddWishEvent extends WishEvent {
  AddWishEvent();
}

class EditWishEvent extends WishEvent {
  final int index;
  final String name;
  final String count;
  EditWishEvent(this.index, this.name, this.count);
}

class EditProductWishEvent extends WishEvent {
  final String name;
  final int count;
  EditProductWishEvent(this.name, this.count);
}

class DeleteWishEvent extends WishEvent {
  final int index;
  DeleteWishEvent(this.index);
}

class ConfirmWishEvent extends WishEvent {
  ConfirmWishEvent();
}

class ClearWishEvent extends WishEvent {
  ClearWishEvent();
}

class WishState {
  List<Wish> wishes = [];
  var newWishes = [];
  Map<String, int> productWishes = {};
  LoadStatus loadStatus = LoadStatus.loaded;

  WishState();

  WishState copyWith({
    List<Wish> wishes,
    LoadStatus loadStatus,
    Map<String, int> productWishes,
    var newWishes,
  }) {
    return WishState()
      ..wishes = wishes ?? this.wishes
      ..loadStatus = loadStatus ?? this.loadStatus
      ..productWishes = productWishes ?? this.productWishes
      ..newWishes = newWishes ?? this.newWishes;
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
    if (event is AddWishEvent) {
      var newWishes = currentState.newWishes;
      newWishes.add({"name": "", "count": 0});
      yield currentState.copyWith(newWishes: newWishes);
    }
    if (event is EditWishEvent) {
      var newWishes = currentState.newWishes;
      newWishes[event.index] = {"name": event.name, "count": event.count};
      yield currentState.copyWith(newWishes: newWishes);
    }
    if (event is EditProductWishEvent) {
      var productWishes = currentState.productWishes;
      productWishes[event.name] = event.count.clamp(0, 100);
      yield currentState.copyWith(productWishes: productWishes);
    }
    if (event is DeleteWishEvent) {
      var newWishes = currentState.newWishes;
      newWishes.removeAt(event.index);
      yield currentState.copyWith(newWishes: newWishes);
    }
    if (event is ConfirmWishEvent) {
      yield currentState.copyWith(loadStatus: LoadStatus.loading);
      for (String name in currentState.productWishes.keys)
        if (currentState.productWishes[name] > 0) await WishApi.add(name, currentState.productWishes[name].toString());

      await Future.wait(List.generate(currentState.newWishes.length,
          (index) => WishApi.add(currentState.newWishes[index]["name"], currentState.newWishes[index]["count"])));
      List<Wish> wishes = await WishApi.all();
      yield currentState.copyWith(wishes: wishes, loadStatus: LoadStatus.loaded, newWishes: [], productWishes: {});
    }
    if (event is ClearWishEvent) yield currentState.copyWith(newWishes: []);
  }
}

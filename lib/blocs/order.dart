part of blocs;

abstract class OrderEvent {}

class FetchOrderEvent extends OrderEvent {
  FetchOrderEvent();
}

class AddOrderEvent extends OrderEvent {
  AddOrderEvent();
}

class EditOrderEvent extends OrderEvent {
  final int index;
  final String name;
  final String count;
  EditOrderEvent(this.index, this.name, this.count);
}

class DeleteOrderEvent extends OrderEvent {
  final int index;
  DeleteOrderEvent(this.index);
}

class ConfirmOrderEvent extends OrderEvent {
  ConfirmOrderEvent();
}

class ClearOrderEvent extends OrderEvent {
  ClearOrderEvent();
}

class OrderState {
  List<Order> orders = [];
  var newOrderes = [];
  LoadStatus loadStatus = LoadStatus.loaded;

  OrderState();

  OrderState copyWith({
    List<Order> orderes,
    LoadStatus loadStatus,
    var newOrderes,
  }) {
    return OrderState()
      ..orders = orderes ?? this.orders
      ..loadStatus = loadStatus ?? this.loadStatus
      ..newOrderes = newOrderes ?? this.newOrderes;
  }
}

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  static OrderBloc _instance;
  static OrderBloc getInstance() {
    if (_instance == null) _instance = OrderBloc();
    return _instance;
  }

  @override
  OrderState get initialState => OrderState();
  NotificationBloc notificationBloc = NotificationBloc.getInstance();

  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    if (event is FetchOrderEvent) {
      yield currentState.copyWith(loadStatus: LoadStatus.loading);
      List<Order> orderes = await OrderApi.all();
      yield currentState.copyWith(orderes: orderes, loadStatus: LoadStatus.loaded);
    }
    if (event is AddOrderEvent) {
      var newOrderes = currentState.newOrderes;
      newOrderes.add({"name": "", "count": 0});
      yield currentState.copyWith(newOrderes: newOrderes);
    }
    if (event is EditOrderEvent) {
      var newOrderes = currentState.newOrderes;
      newOrderes[event.index] = {"name": event.name, "count": event.count};
      yield currentState.copyWith(newOrderes: newOrderes);
    }
    if (event is DeleteOrderEvent) {
      var newOrderes = currentState.newOrderes;
      newOrderes.removeAt(event.index);
      yield currentState.copyWith(newOrderes: newOrderes);
    }
    if (event is ConfirmOrderEvent) {
      yield currentState.copyWith(loadStatus: LoadStatus.loading);
      await Future.wait(List.generate(currentState.newOrderes.length,
          (index) => OrderApi.add(currentState.newOrderes[index]["name"], currentState.newOrderes[index]["count"])));
      List<Order> orderes = await OrderApi.all();
      yield currentState.copyWith(orderes: orderes, loadStatus: LoadStatus.loaded, newOrderes: []);
    }
    if (event is ClearOrderEvent) yield currentState.copyWith(newOrderes: []);
  }
}

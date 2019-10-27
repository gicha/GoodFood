part of blocs;

abstract class OrderEvent {}

class FetchOrderEvent extends OrderEvent {
  FetchOrderEvent();
}

class DeleteOrderEvent extends OrderEvent {
  final int id;
  DeleteOrderEvent(this.id);
}

class ConfirmOrderEvent extends OrderEvent {
  final int id;
  ConfirmOrderEvent(this.id);
}

class OrderState {
  List<Order> orders = [];
  LoadStatus loadStatus = LoadStatus.loaded;

  OrderState();

  OrderState copyWith({
    List<Order> orderes,
    LoadStatus loadStatus,
  }) {
    return OrderState()
      ..orders = orderes ?? this.orders
      ..loadStatus = loadStatus ?? this.loadStatus;
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
    if (event is DeleteOrderEvent) {
      yield currentState.copyWith(loadStatus: LoadStatus.loading);
      OrderApi.delete(event.id);
      List<Order> orderes = await OrderApi.all();
      yield currentState.copyWith(orderes: orderes, loadStatus: LoadStatus.loaded);
    }
    if (event is ConfirmOrderEvent) {
      yield currentState.copyWith(loadStatus: LoadStatus.loading);
      OrderApi.confirm(event.id);
      List<Order> orderes = await OrderApi.all();
      yield currentState.copyWith(orderes: orderes, loadStatus: LoadStatus.loaded);
    }
  }
}

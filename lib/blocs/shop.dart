part of blocs;

enum LoadStatus { loading, loaded, error }

abstract class ShopEvent {}

class FetchShopEvent extends ShopEvent {
  final List<Shop> shops;
  final LatLngBounds bounds;
  FetchShopEvent({this.bounds, this.shops});
}

class UpdateSelfLocationShopEvent extends ShopEvent {
  final LatLng location;
  UpdateSelfLocationShopEvent(this.location);
}

class SetFilterEvent extends ShopEvent {
  SetFilterEvent(this.filter);
  final List<String> filter;
}

class ShopPreviewEvent extends ShopEvent {
  final Shop shop;
  ShopPreviewEvent({this.shop});
}

// class BuildRouteEvent extends ShopEvent {
//   final LatLng myLocation;
//   final String place;
//   final LatLng latLng;
//   BuildRouteEvent(this.myLocation, this.place, {this.latLng = null});
// }

class ShopState {
  Shop shopToPreview;
  List<Shop> shops = [];
  List<String> filter = [];
  bool isRefreshed;
  bool buildingRoute = false;
  LoadStatus loadStatus = LoadStatus.loading;
  LatLng selfLocation;
  LatLngBounds bounds;
  Map<String, LatLng> markers = Map<String, LatLng>();
  Polyline route;
  Polyline tempRoute;
  Shop tempShop;
  Shop routeShop;
  LatLng finishPoint;

  ShopState();

  ShopState copyWith({
    List<Shop> shops,
    // List<ShopType> types,
    List<String> filter,
    Shop shopToPreview,
    bool isRefreshed,
    bool buildingRoute,
    List<String> filters,
    Map<String, LatLng> markers,
    Map<String, List<LatLng>> polylines,
    LoadStatus loadStatus,
    LatLngBounds bounds,
    LatLng selfLocation,
    Polyline route,
    Shop routeShop,
    LatLng finishPoint,
  }) {
    return ShopState()
      ..shopToPreview = shopToPreview ?? this.shopToPreview
      ..shops = shops ?? this.shops
      // ..types = types ?? this.types
      // ..filter = filter ?? this.filter
      ..isRefreshed = isRefreshed ?? this.isRefreshed
      ..buildingRoute = buildingRoute ?? this.buildingRoute
      ..markers = markers ?? this.markers
      ..loadStatus = loadStatus ?? this.loadStatus
      ..bounds = bounds ?? this.bounds
      ..selfLocation = selfLocation ?? this.selfLocation
      ..route = route ?? this.route
      ..routeShop = routeShop ?? this.routeShop
      ..finishPoint = finishPoint ?? this.finishPoint;
  }
}

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  static ShopBloc _instance;
  static ShopBloc getInstance() {
    if (_instance == null) _instance = ShopBloc();
    return _instance;
  }

  @override
  ShopState get initialState => ShopState();
  NotificationBloc notificationBloc = NotificationBloc.getInstance();

  @override
  Stream<ShopState> mapEventToState(ShopEvent event) async* {
    if (event is FetchShopEvent) {
      if (event.shops != null && event.shops.length > 0) {
        if (currentState.shopToPreview == null)
          yield currentState.copyWith(
            shopToPreview: currentState.shopToPreview ?? event.shops.first,
            shops: event.shops,
            bounds: event.bounds,
          );
        else
          yield currentState.copyWith(
            shops: event.shops,
            bounds: event.bounds,
          );
      } else
        yield currentState.copyWith(
          shops: [],
          bounds: event.bounds,
        );
    }
    if (event is SetFilterEvent) {
      yield currentState.copyWith(filter: event?.filter);
    }
    if (event is ShopPreviewEvent) yield currentState.copyWith(shopToPreview: event?.shop);
    if (event is UpdateSelfLocationShopEvent) yield currentState.copyWith(selfLocation: event.location);
    // if (event is BuildRouteEvent) {
    //   yield currentState.copyWith(buildingRoute: true);
    //   if (event.place == '' && event.latLng == null) {
    //     yield currentState.copyWith(
    //         route: null, finishPoint: null, routeShop: null, shopToPreview: null, buildingRoute: false);
    //     return;
    //   }
    //   if (event.latLng != null) {
    //     String address = await RouteApi.getAddress(event.latLng);
    //     var data = await RouteApi.route(event.myLocation, address).catchError((e) {});
    //     yield currentState.copyWith(
    //         route: data["polyline"],
    //         finishPoint: data["to"],
    //         routeShop: data["shop"],
    //         shopToPreview: data["shop"],
    //         buildingRoute: false);
    //     return;
    //   }
    //   var data = await RouteApi.route(event.myLocation, event.place).catchError((e) {});
    //   yield currentState.copyWith(
    //       route: data["polyline"],
    //       finishPoint: data["to"],
    //       routeShop: data["shop"],
    //       shopToPreview: data["shop"],
    //       buildingRoute: false);
    // }
  }
}

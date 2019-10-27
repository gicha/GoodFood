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

class FindProductsEvent extends ShopEvent {
  final String findString;
  FindProductsEvent(this.findString);
}

class BuildRouteEvent extends ShopEvent {
  final LatLng myLocation;
  BuildRouteEvent(this.myLocation);
}

class DestroyRouteEvent extends ShopEvent {
  DestroyRouteEvent();
}

class ShopState {
  Shop shopToPreview;
  List<Shop> shops = [];
  String findString;
  LoadStatus loadStatus = LoadStatus.loaded;
  Polyline route;

  ShopState();

  ShopState copyWith({
    List<Shop> shops,
    Shop shopToPreview,
    String findString,
    LoadStatus loadStatus,
    Polyline route,
  }) {
    return ShopState()
      ..shopToPreview = shopToPreview ?? this.shopToPreview
      ..shops = shops ?? this.shops
      ..findString = findString ?? this.findString
      ..loadStatus = loadStatus ?? this.loadStatus
      ..route = route ?? this.route;
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
      List<Shop> shops = [];
      for (Shop shop in event.shops) if (shop.products.length != 0) shops.add(shop);
      if (shops != null && shops.length > 0) {
        if (currentState.shopToPreview == null)
          yield currentState.copyWith(
            shopToPreview: currentState.shopToPreview ?? shops.first,
            shops: shops,
          );
        else
          yield currentState.copyWith(shops: shops);
      } else
        yield currentState.copyWith(shops: []);
      yield currentState.copyWith(loadStatus: LoadStatus.loaded);
    }

    if (event is ShopPreviewEvent) yield currentState.copyWith(shopToPreview: event?.shop);
    if (event is FindProductsEvent) {
      yield currentState.copyWith(loadStatus: LoadStatus.loading);
      List<Shop> shops =
          (event.findString ?? "").length == 0 ? (await ShopApi.all()) : (await ShopApi.byTag(event.findString));
      yield currentState.copyWith(shops: shops, loadStatus: LoadStatus.loaded, shopToPreview: shops.first)
        ..findString = (event.findString ?? "").length == 0 ? null : event.findString;
    }
    if (event is DestroyRouteEvent) {
      yield ShopState()
        ..shopToPreview = currentState.shopToPreview
        ..shops = currentState.shops
        ..findString = currentState.findString
        ..loadStatus = currentState.loadStatus
        ..route = null;
    }
    if (event is BuildRouteEvent) {
      yield currentState.copyWith(
          route: await getRoute(event.myLocation, currentState.shopToPreview.address.coordinates));
    }
  }

  Future<Polyline> getRoute(LatLng position, LatLng shop) async {
    List<LatLng> points = [];
    Response<dynamic> data = await (new Dio())
        .get(
            "https://route.api.here.com/routing/7.2/calculateroute.json?app_id=Bq3kB3NYLmccVbOlRTeW&app_code=F9RaU4irG-_A2c2QGOCipw&waypoint0=geo!${position.latitude},${position.longitude}&waypoint1=geo!${shop.latitude},${shop.longitude}&mode=fastest;car;traffic:enabled")
        .catchError((e) {});
    for (var point in data.data['response']['route'][0]['leg'][0]['maneuver'])
      points.add(LatLng(point["position"]["latitude"], point["position"]["longitude"]));
    return Polyline(polylineId: PolylineId(""), points: points, color: ITColors.primary.withOpacity(0.8), width: 7);
  }
}

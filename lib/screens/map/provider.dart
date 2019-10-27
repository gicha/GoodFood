import 'dart:async';

import 'package:goodfood/api/api.dart';
import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/models/models.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as ln;

class MapProvider {
  MapProvider({@required this.shopBloc, @required this.selfBloc, this.findController});

  // blocs
  final ShopBloc shopBloc;
  final SelfBloc selfBloc;
  final TextEditingController findController;
  // controllers
  GoogleMapController controller;

  //other
  StreamSubscription locationSubscr;
  LatLngBounds lastBounds;
  CameraPosition lastPosition;

  subscribeOnLocation(StreamSubscription locationSubscr) {
    locationSubscr = ln.Location().onLocationChanged().listen((ln.LocationData currentLocation) {
      selfBloc.dispatch(
        SetPosition(
          LatLng(currentLocation.latitude, currentLocation.longitude),
        ),
      );
    });
  }

  void onMapCreate(GoogleMapController _controller) {
    controller = _controller;
  }

  void onCameraIdle() async {
    List<Shop> shops;
    if (lastBounds == null) lastBounds = await controller.getVisibleRegion();
    shops = (shopBloc.currentState.findString ?? "").length == 0
        ? await ShopApi.all()
        : await ShopApi.byTag(shopBloc.currentState.findString);
    shopBloc.dispatch(FetchShopEvent(shops: shops, bounds: lastBounds));
  }

  animateToShop(Shop shop) {
    if (lastPosition?.zoom == null) return;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(target: shop.address.coordinates, zoom: lastPosition?.zoom)),
    );
  }

  onCameraMove(CameraPosition position) async {
    lastPosition = position;
    lastBounds = await controller.getVisibleRegion();
  }

  animateToLocation() {
    if (selfBloc?.currentState?.position == null) {
      selfBloc.dispatch(UpdatePosition());
    } else {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: selfBloc?.currentState?.position, zoom: 13.0),
        ),
      );
    }
  }

  buildRoute() => shopBloc.dispatch(BuildRouteEvent(selfBloc?.currentState?.position));
}

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

  // initFilter() async {
  //   List<Shop> shops = await ShopApi.all();
  //   shopBloc.dispatch(
  //     SetTypesEvent(types),
  //   );
  // }

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
    shops = await ShopApi.all();
    shopBloc.dispatch(FetchShopEvent(shops: shops, bounds: lastBounds));
  }

  animateToShop(Shop shop) {
    if (lastPosition?.zoom == null) return;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: shop.address.coordinates, zoom: lastPosition?.zoom),
      ),
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
          CameraPosition(target: selfBloc?.currentState?.position, zoom: 15.1),
        ),
      );
    }
  }
}
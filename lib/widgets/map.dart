import 'dart:ui' as ui;

import 'package:goodfood/generated/i18n.dart';
import 'package:goodfood/models/model.dart';
import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/res/res.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final LatLng center;
  final double centerZoom;
  final StoreBloc shopBloc;
  final LatLng selfPosition;
  final void Function(GoogleMapController) onMapCreate;
  final void Function(CameraPosition) onCameraMove;
  final void Function() onCameraIdle;
  final String styleAsset;
  MapWidget({
    Key key,
    @required this.center,
    @required this.shopBloc,
    this.selfPosition,
    this.styleAsset = 'assets/map/style.txt',
    this.onCameraMove,
    this.onCameraIdle,
    this.onMapCreate,
    this.centerZoom,
  }) : super(key: key);

  @override
  MapWidgetState createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  LatLng get center => widget.center;
  double get centerZoom => widget.centerZoom;
  StoreBloc get shopBloc => widget.shopBloc;
  DialogBloc get dialogBloc => DialogBloc.getInstance();
  LatLng get selfPosition => widget.selfPosition;
  NotificationBloc get notificationBloc => NotificationBloc.getInstance();
  String get styleAsset => widget.styleAsset;
  Function get onMapCreate => widget.onMapCreate;
  Function get onCameraMove => widget.onCameraMove;
  Function get onCameraIdle => widget.onCameraIdle;

  BitmapDescriptor selfMarkerBitmap;
  BitmapDescriptor primaryMarkerBitmap;
  BitmapDescriptor choosedMarkerBitmap;
  BitmapDescriptor routeMarkerBitmap;

  List<Marker> markers = [];

  String _mapStyle;
  CameraPosition _initialCameraPosition;

  GoogleMapController mapController;

  @override
  void initState() {
    buildSelfBitmap().then((bitmap) => setState(() => selfMarkerBitmap = bitmap));
    buildStoreBitmap(ITColors.primary).then((bitmap) => setState(() => primaryMarkerBitmap = bitmap));
    buildStoreBitmap(Colors.blue).then((bitmap) => setState(() => choosedMarkerBitmap = bitmap));
    buildStoreBitmap(Colors.red).then((bitmap) => setState(() => routeMarkerBitmap = bitmap));
    _initialCameraPosition = CameraPosition(target: center, zoom: centerZoom != null ? centerZoom : 11.1);
    super.initState();
    rootBundle.loadString(styleAsset).then((string) {
      _mapStyle = string;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: shopBloc,
      builder: (context, StoreState shopBlocState) {
        return GoogleMap(
          onCameraMove: (CameraPosition position) => onCameraMove != null ? onCameraMove(position) : () => {},
          onCameraIdle: () => onCameraIdle != null ? onCameraIdle() : () => {},
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (GoogleMapController _controller) async {
            mapController = _controller;
            _controller.setMapStyle(_mapStyle);
            if (onMapCreate != null) onMapCreate(_controller);
          },
          onLongPress: (LatLng aimLocation) {
            if (selfPosition.latitude != null) {
              dialogBloc.dispatch(OpenDialogEvent(
                  confirm: () => shopBloc.dispatch(
                      BuildRouteEvent(LatLng(selfPosition.latitude, selfPosition.longitude), '', latLng: aimLocation)),
                  text: I18n.of(context).toNearestStore));
            } else
              notificationBloc.dispatch(NotificationEvent(I18n.of(context).findLocation));
          },
          compassEnabled: false,
          rotateGesturesEnabled: false,
          tiltGesturesEnabled: false,
          markers: buildMarkers(
              shopBlocState.shops, shopBlocState.routeStore, shopBlocState.finishPoint, shopBlocState.shopToPreview),
          polylines: shopBlocState.route == null ? Set() : Set.from([shopBlocState.route]),
        );
      },
    );
  }

  Set<Marker> buildMarkers(List<Store> shops, Store routeStore, LatLng finish, Store previewStore) {
    return [
      ...List.generate(shops.length, (index) {
        if (shops[index]?.location?.coordinates != null && primaryMarkerBitmap != null)
          return Marker(
            markerId: MarkerId(shops[index].id.toString()),
            consumeTapEvents: true,
            icon: primaryMarkerBitmap,
            position: shops[index]?.location?.coordinates,
            onTap: () {
              mapController.animateCamera(CameraUpdate.newLatLngZoom(shops[index].location.coordinates, 14));
              shopBloc.dispatch(
                StorePreviewEvent(shop: shops[index]),
              );
            },
          );
        return Marker(markerId: MarkerId(""));
      }),
      if (routeStore?.location?.coordinates != null && choosedMarkerBitmap != null)
        Marker(
            markerId: MarkerId(routeStore.id.toString()),
            consumeTapEvents: true,
            icon: choosedMarkerBitmap,
            position: routeStore.location.coordinates,
            onTap: () {
              mapController.animateCamera(CameraUpdate.newLatLngZoom(routeStore.location.coordinates, 14));
              shopBloc.dispatch(StorePreviewEvent(shop: routeStore));
            }),
      if (finish != null && routeMarkerBitmap != null)
        Marker(markerId: MarkerId("finish"), consumeTapEvents: true, icon: routeMarkerBitmap, position: finish),
      if (previewStore?.location?.coordinates != null && choosedMarkerBitmap != null)
        Marker(
            markerId: MarkerId(previewStore.id.toString()),
            consumeTapEvents: true,
            icon: choosedMarkerBitmap,
            position: previewStore.location.coordinates,
            onTap: () {
              mapController.animateCamera(CameraUpdate.newLatLngZoom(previewStore.location.coordinates, 14));
              shopBloc.dispatch(StorePreviewEvent(shop: previewStore));
            }),
      if (selfPosition != null && selfMarkerBitmap != null)
        Marker(
          markerId: MarkerId("self"),
          position: selfPosition,
          consumeTapEvents: true,
          icon: selfMarkerBitmap,
        )
    ].toSet();
  }

  buildSelfBitmap() async {
    var pictureRecorder = ui.PictureRecorder();
    var canvas = Canvas(pictureRecorder);
    var paint = Paint();
    paint.isAntiAlias = true;
    paint.color = ITColors.primaryDark;
    canvas.drawCircle(
        Offset(ui.window.devicePixelRatio * 5, ui.window.devicePixelRatio * 5), ui.window.devicePixelRatio * 5, paint);
    paint.color = Colors.white;
    canvas.drawCircle(
        Offset(ui.window.devicePixelRatio * 5, ui.window.devicePixelRatio * 5), ui.window.devicePixelRatio * 3, paint);
    var pic = pictureRecorder.endRecording();
    ui.Image img =
        await pic.toImage((ui.window.devicePixelRatio * 20).toInt(), (ui.window.devicePixelRatio * 20).toInt());
    var byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(byteData.buffer.asUint8List());
  }

  buildStoreBitmap(Color color) async {
    var pictureRecorder = ui.PictureRecorder();
    var size = ui.window.devicePixelRatio;
    var canvas = Canvas(pictureRecorder);
    var paint = Paint()
      ..color = color
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size * 5, size * 5), size * 5, paint);
    canvas.drawPath(getTrianglePath(size * 10, size * 20), paint);
    var pic = pictureRecorder.endRecording();
    ui.Image img = await pic.toImage((size * 20).toInt(), (size * 20).toInt());
    var byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(byteData.buffer.asUint8List());
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(x * .07, y * .38)
      ..lineTo(x * .94, y * .38)
      ..lineTo(x * .5, y * .66)
      ..lineTo(x * .07, y * .38);
  }
}

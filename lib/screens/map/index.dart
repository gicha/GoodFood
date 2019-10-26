import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/screens/map/provider.dart';
import 'package:goodfood/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'view/index.dart';

/// Map Screen
/// {@category Screens}
class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with AutomaticKeepAliveClientMixin {
  // blocs
  ShopBloc shopBloc;
  SelfBloc selfBloc;
  //other
  StreamSubscription locationSubscr;
  MapProvider provider;
  TextEditingController findController;

  @override
  void initState() {
    selfBloc = SelfBloc.getInstance();
    selfBloc.dispatch(UpdatePosition());
    shopBloc = ShopBloc.getInstance();
    findController = TextEditingController();
    provider = MapProvider(shopBloc: shopBloc, selfBloc: selfBloc, findController: findController);
    provider.initFilter();
    provider.subscribeOnLocation(locationSubscr);
    super.initState();
  }

  @override
  void dispose() {
    locationSubscr?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder(
      bloc: selfBloc,
      builder: (context, SelfState state) {
        if (state.position != null) {
          return MapView(
            provider: provider,
          );
        } else
          return ITLoading();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

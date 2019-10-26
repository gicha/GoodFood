import 'package:animator/animator.dart';
import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/models/models.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/screens/map/provider.dart';
import 'package:goodfood/screens/map/widgets/find_line.dart';
import 'package:goodfood/screens/map/widgets/location.dart';
import 'package:goodfood/screens/map/widgets/product.dart';
import 'package:goodfood/screens/map/widgets/shop_info.dart';
import 'package:goodfood/widgets/loading.dart';
import 'package:goodfood/widgets/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapView extends StatefulWidget {
  const MapView({Key key, @required this.provider}) : super(key: key);
  final MapProvider provider;

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  MapProvider get provider => widget.provider;
  ShopBloc get shopBloc => provider.shopBloc;
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  PanelController panelController = PanelController();

  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.vertical(top: Radius.circular(16.0));
    return WillPopScope(
      onWillPop: () async {
        if (panelController.isPanelOpen()) {
          panelController.close();
          return false;
        }
        return true;
      },
      child: SafeArea(
        child: SlidingUpPanel(
          controller: panelController,
          parallaxEnabled: true,
          parallaxOffset: 0.8,
          minHeight: 120,
          maxHeight: height - 208,
          borderRadius: radius,
          defaultPanelState: PanelState.CLOSED,
          panel: BlocBuilder(
            bloc: shopBloc,
            builder: (context, ShopState state) {
              return Container(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    if (state.shopToPreview != null) ...[
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 16),
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                              color: ITColors.secondaryText.withOpacity(.2), borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      ShopInfo(shop: state.shopToPreview),
                      Divider(
                        height: 2,
                      ),
                      Container(
                        height: height - 330,
                        child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                              state.shopToPreview.products?.length ?? 0,
                              (index) => ProductWidget(product: state.shopToPreview.products[index]),
                            ),
                          ),
                        ),
                      ),
                    ] else
                      Container(
                        height: 180,
                        child: Center(child: ITLoading()),
                      )
                  ],
                ),
              );
            },
          ),
          body: BlocBuilder(
            bloc: shopBloc,
            builder: (context, ShopState state) {
              return Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: MapWidget(
                      shopBloc: shopBloc,
                      center: provider.selfBloc.currentState.position,
                      selfPosition: provider.selfBloc.currentState.position,
                      onMapCreate: provider.onMapCreate,
                      onCameraMove: provider.onCameraMove,
                      onCameraIdle: provider.onCameraIdle,
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.topCenter,
                  //   child: Container(
                  //     margin: EdgeInsets.only(
                  //       top: 12,
                  //     ),
                  //     child: FindLineView(provider: provider),
                  //   ),
                  // ),
                  Positioned(
                    bottom: 220 + MediaQuery.of(context).viewPadding.bottom,
                    right: 12,
                    child: Container(
                      margin: EdgeInsets.only(left: 8, bottom: 8),
                      child: LocationWidget(
                        onTap: provider.animateToLocation,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

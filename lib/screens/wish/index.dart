import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/screens/wish/provider.dart';
import 'package:flutter/material.dart';

import 'view/index.dart';

/// Wish Screen
/// {@category Screens}
class WishScreen extends StatefulWidget {
  @override
  _WishScreenState createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> with AutomaticKeepAliveClientMixin {
  // blocs
  WishBloc wishBloc;
  //other

  WishProvider provider;

  ScrollController scrollController;

  @override
  void initState() {
    wishBloc = WishBloc.getInstance();
    scrollController = ScrollController();
    provider = WishProvider(wishBloc: wishBloc, scrollController: scrollController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WishView(provider: provider);
  }

  @override
  bool get wantKeepAlive => true;
}

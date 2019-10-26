import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/screens/order/provider.dart';
import 'package:flutter/material.dart';

import 'view/index.dart';

/// Order Screen
/// {@category Screens}
class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with AutomaticKeepAliveClientMixin {
  // blocs
  OrderBloc orderBloc;
  //other

  OrderProvider provider;

  ScrollController scrollController;

  @override
  void initState() {
    orderBloc = OrderBloc.getInstance();
    scrollController = ScrollController();
    provider = OrderProvider(orderBloc: orderBloc, scrollController: scrollController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return OrderView(provider: provider);
  }

  @override
  bool get wantKeepAlive => true;
}

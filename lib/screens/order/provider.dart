import 'package:goodfood/blocs/blocs.dart';
import 'package:flutter/material.dart';

class OrderProvider {
  OrderProvider({@required this.orderBloc, @required this.scrollController});

  // blocs
  final OrderBloc orderBloc;
  final ScrollController scrollController;
}

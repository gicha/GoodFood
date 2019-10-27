import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/blocs/blocs.dart' as bloc;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodfood/screens/order/provider.dart';
import 'package:goodfood/screens/order/widgets/appbar.dart';
import 'package:goodfood/screens/order/widgets/noorder.dart';
import 'package:goodfood/screens/order/widgets/order_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key key, @required this.provider}) : super(key: key);
  final OrderProvider provider;

  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  OrderProvider get provider => widget.provider;
  OrderBloc get orderBloc => provider.orderBloc;
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void setLoadStatus(status) {
    if (status == bloc.LoadStatus.loaded) _refreshController.refreshCompleted();
    if (status == bloc.LoadStatus.error) _refreshController.refreshFailed();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SafeArea(
        child: BlocBuilder(
          bloc: orderBloc,
          builder: (context, OrderState state) {
            setLoadStatus(state.loadStatus);
            return Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 60),
                  child: SmartRefresher(
                    enablePullDown: true,
                    controller: _refreshController,
                    onRefresh: () => OrderBloc.getInstance().dispatch(FetchOrderEvent()),
                    child: SingleChildScrollView(
                      controller: provider.scrollController,
                      child: Column(
                        children: [
                          if ((state.orders ?? []).length == 0) NoOrdersWidget(),
                          if ((state.orders ?? []).length != 0)
                            ...List.generate(state.orders.length, (index) {
                              return state.orders[index].content.length == 0
                                  ? Container()
                                  : OrderItemWidget(order: state.orders[index]);
                            }),
                          if ((state.orders ?? []).length != 0)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  "assets/images/red_human.png",
                                  height: MediaQuery.of(context).size.height * .5,
                                  width: MediaQuery.of(context).size.width * .7,
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width * .02),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                OrderAppBarWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}

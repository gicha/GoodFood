import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/blocs/blocs.dart' as bloc;
import 'package:goodfood/screens/wish/provider.dart';
import 'package:goodfood/screens/wish/widgets/appbar.dart';
import 'package:goodfood/screens/wish/widgets/nowishes.dart';
import 'package:goodfood/screens/wish/widgets/wish_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WishView extends StatefulWidget {
  const WishView({Key key, @required this.provider}) : super(key: key);
  final WishProvider provider;

  @override
  _WishViewState createState() => _WishViewState();
}

class _WishViewState extends State<WishView> {
  WishProvider get provider => widget.provider;
  WishBloc get wishBloc => provider.wishBloc;
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
          bloc: wishBloc,
          builder: (context, WishState state) {
            setLoadStatus(state.loadStatus);
            return Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 60),
                  child: SmartRefresher(
                    enablePullDown: true,
                    controller: _refreshController,
                    onRefresh: () => WishBloc.getInstance().dispatch(FetchWishEvent()),
                    child: SingleChildScrollView(
                      controller: provider.scrollController,
                      child: Column(
                        children: [
                          if ((state.wishes ?? []).length == 0) NoWishesWidget(),
                          if ((state.wishes ?? []).length != 0)
                            ...List.generate(state.wishes.length, (index) => WishItemWidget(wish: state.wishes[index])),
                          if ((state.wishes ?? []).length != 0)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  "assets/images/blue_human.png",
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
                WishAppBarWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:animator/animator.dart';
import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/models/models.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/screens/wish/provider.dart';
import 'package:goodfood/screens/wish/widgets/appbar.dart';
import 'package:goodfood/screens/wish/widgets/nowishes.dart';
import 'package:goodfood/screens/wish/widgets/wish_item.dart';
import 'package:goodfood/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SafeArea(
        child: BlocBuilder(
          bloc: wishBloc,
          builder: (context, WishState state) {
            return Column(
              children: <Widget>[
                WishAppBarWidget(),
                if ((state.wishes ?? []).length == 0) NoWishesWidget(),
                if ((state.wishes ?? []).length != 0)
                  ...List.generate(state.wishes.length, (index) => WishItemWidget(wish: state.wishes[index]))
              ],
            );
          },
        ),
      ),
    );
  }
}

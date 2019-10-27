import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/screens/wish_editor/widgets/appbar.dart';
import 'package:goodfood/screens/wish_editor/widgets/nowishes.dart';
import 'package:goodfood/screens/wish_editor/widgets/wish_item.dart';
import 'package:goodfood/screens/wish_editor/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishEditorView extends StatefulWidget {
  const WishEditorView({Key key, @required this.provider}) : super(key: key);
  final WishEditorProvider provider;

  @override
  _WishEditorViewState createState() => _WishEditorViewState();
}

class _WishEditorViewState extends State<WishEditorView> {
  WishEditorProvider get provider => widget.provider;
  WishBloc get wishBloc => provider.wishBloc;
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Container(
        color: ITColors.bg,
        child: SafeArea(
          child: BlocBuilder(
            bloc: wishBloc,
            builder: (context, WishState state) {
              return Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    padding: EdgeInsets.only(top: 60),
                    child: Column(
                      children: [
                        if (state.newWishes.length == 0) NoWishesWidget(),
                        ...List.generate(state.newWishes.length, (index) => WishItemWidget(page: index)),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => wishBloc.dispatch(AddWishEvent()),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 7),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF2B44FF),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              "assets/images/pero.png",
                              height: MediaQuery.of(context).size.height * .5,
                              width: MediaQuery.of(context).size.width * .7,
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * .02),
                          ],
                        ),
                      ],
                    ),
                  ),
                  WishAppBarWidget(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

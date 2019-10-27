import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/generated/i18n.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/res/text_style.dart';

class WishAppBarWidget extends StatelessWidget {
  const WishAppBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(color: ITColors.bg, boxShadow: [
        BoxShadow(
          color: ITColors.secondaryText.withOpacity(.6),
          blurRadius: 2.0,
        ),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              DialogBloc.getInstance().dispatch(
                OpenDialogEvent(
                    confirm: () {
                      WishBloc.getInstance().dispatch(ClearWishEvent());
                      Navigator.pop(context);
                    },
                    text: I18n.of(context).leaveWithoutSave),
              );
            },
            child: Container(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .05),
              child: Text(
                I18n.of(context).cancel.toLowerCase(),
                style: ITTextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          BlocBuilder(
              bloc: WishBloc.getInstance(),
              builder: (context, WishState state) {
                return GestureDetector(
                  onTap: () {
                    WishBloc.getInstance().dispatch(ConfirmWishEvent());
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * .05),
                    child: state.loadStatus == LoadStatus.loading
                        ? Container(
                            padding: EdgeInsets.all(8),
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(ITColors.primary),
                            ),
                          )
                        : Text(
                            I18n.of(context).save.toLowerCase(),
                            style: ITTextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}

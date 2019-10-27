import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:goodfood/api/api.dart';
import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/generated/i18n.dart';
import 'package:goodfood/models/models.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/res/text_style.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class WishItemWidget extends StatelessWidget {
  const WishItemWidget({Key key, @required this.wish}) : super(key: key);
  final Wish wish;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableStrechActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        padding: EdgeInsets.only(top: 30, left: 30, right: 15, bottom: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .4,
                  child: AutoSizeText(
                    wish.category,
                    style: ITTextStyle(fontWeight: FontWeight.bold, color: ITColors.text, fontSize: 16),
                    minFontSize: 13,
                    maxFontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text('${wish.needCount.floor().toString()} pcs.',
                    style: ITTextStyle(color: ITColors.text, fontSize: 14)),
              ],
            ),
            // Expanded(child: Container()),
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width * .45,
              child: FAProgressBar(
                currentValue: ((wish.existCount / wish.needCount * 100) ?? 0).floor().clamp(20, 100),
                direction: Axis.horizontal,
                progressColor: ITColors.primary,
                backgroundColor: ITColors.bg,
                borderRadius: 45,
                animatedDuration: Duration(milliseconds: 0),
              ),
            ),
          ],
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: I18n.of(context).delete,
          color: ITColors.red,
          icon: Icons.delete,
          closeOnTap: true,
          onTap: () async {
            await WishApi.delete(wish.id);
            WishBloc.getInstance().dispatch(FetchWishEvent());
          },
        ),
      ],
    );
  }
}

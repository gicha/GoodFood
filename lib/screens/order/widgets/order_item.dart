import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:goodfood/api/api.dart';
import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/models/models.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/res/text_style.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class ContentItemWidget extends StatelessWidget {
  const ContentItemWidget({Key key, @required this.content}) : super(key: key);
  final Content content;

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
                Text(content.product.name,
                    style: ITTextStyle(fontWeight: FontWeight.bold, color: ITColors.text, fontSize: 16)),
                SizedBox(height: 10),
                Text('${content.count.floor().toString()} pcs.',
                    style: ITTextStyle(color: ITColors.text, fontSize: 14)),
              ],
            ),
            // Expanded(child: Container()),
          ],
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: ITColors.red,
          icon: Icons.delete,
          closeOnTap: false,
          onTap: () async {
            // await OrderApi.delete(order.id);
            OrderBloc.getInstance().dispatch(FetchOrderEvent());
          },
        ),
      ],
    );
  }
}

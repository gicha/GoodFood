import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:goodfood/models/models.dart';
import 'package:flutter/material.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/res/text_style.dart';
import 'package:goodfood/utils/utils.dart';
import 'package:goodfood/widgets/image.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key key, this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableStrechActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: MediaQuery.of(context).size.width * .05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: [
              Container(
                width: 60,
                height: 60,
                child: ITImage(product.image),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * .05),
              Container(
                width: MediaQuery.of(context).size.width * .4,
                child: AutoSizeText(
                  '${product.name}',
                  maxFontSize: 14,
                  minFontSize: 13,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  style: ITTextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${Utils.getDateTimeDifference(product.date)}', style: ITTextStyle(color: ITColors.secondaryText)),
                Text('${product.count} pcs.', style: ITTextStyle(color: ITColors.secondaryText)),
              ],
            )
          ],
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          closeOnTap: false,
          iconWidget: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.add, color: Colors.white),
              ),
              Container(color: Colors.white, width: 10, height: 2),
            ],
          ),
          // caption: 'Add',
          color: ITColors.primary,
          // icon: Icons.add,
          onTap: () => () {},
        ),
        // IconSlideAction(
        //   caption: 'Delete',
        //   color: ITColors.red,
        //   icon: Icons.delete,
        //   onTap: () => () {},
        // ),
      ],
    );
  }
}

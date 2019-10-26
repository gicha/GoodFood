import 'package:auto_size_text/auto_size_text.dart';
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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: MediaQuery.of(context).size.width * .05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ITImage(
            product.image,
            width: 30,
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .4,
            child: AutoSizeText(
              '${product.name}',
              maxFontSize: 16,
              minFontSize: 14,
              maxLines: 2,
              textAlign: TextAlign.start,
              style: ITTextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('${Utils.getDateTime(dateTime: product.date)}', style: ITTextStyle(color: ITColors.secondaryText)),
              Text('${product.count} pcs.', style: ITTextStyle(color: ITColors.secondaryText)),
            ],
          )
        ],
      ),
    );
  }
}

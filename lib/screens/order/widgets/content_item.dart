import 'package:flutter/material.dart';
import 'package:goodfood/models/models.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/res/text_style.dart';
import 'package:goodfood/widgets/image.dart';
import 'package:line_icons/line_icons.dart';

class ContentItemWidget extends StatelessWidget {
  const ContentItemWidget({Key key, @required this.content}) : super(key: key);
  final Content content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 30, right: 15, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content.store,
            style: ITTextStyle(
              fontWeight: FontWeight.bold,
              color: ITColors.text,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                child: ITImage(content.product.image),
              ),
              SizedBox(width: 10),
              Column(children: [
                Text(content.product.name,
                    style: ITTextStyle(
                      color: ITColors.text,
                      fontSize: 14,
                    )),
                SizedBox(height: 10),
                Text('${content.count.floor().toString()} pcs.',
                    style: ITTextStyle(
                      fontWeight: FontWeight.bold,
                      color: ITColors.text,
                      fontSize: 16,
                    )),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}

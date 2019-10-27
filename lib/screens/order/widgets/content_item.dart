import 'package:flutter/material.dart';
import 'package:goodfood/models/models.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/res/text_style.dart';
import 'package:goodfood/widgets/image.dart';

class ContentItemWidget extends StatelessWidget {
  const ContentItemWidget({Key key, @required this.content}) : super(key: key);
  final Content content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 15, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content.store,
            style: ITTextStyle(
              fontWeight: FontWeight.bold,
              color: ITColors.text,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                child: ITImage(content.product.image),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .55,
                    child: Text(
                      content.product.name,
                      style: ITTextStyle(
                        fontWeight: FontWeight.bold,
                        color: ITColors.secondaryText,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  Text('${content.count.floor().toString()} pcs.',
                      style: ITTextStyle(
                        color: ITColors.text,
                        fontSize: 14,
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

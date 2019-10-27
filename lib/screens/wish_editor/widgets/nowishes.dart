import 'package:flutter/material.dart';
import 'package:goodfood/generated/i18n.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/res/text_style.dart';

class NoWishesWidget extends StatelessWidget {
  const NoWishesWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            I18n.of(context).addWish,
            textAlign: TextAlign.center,
            style: ITTextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ITColors.text),
          ),
        ],
      ),
    );
  }
}

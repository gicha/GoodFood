import 'package:flutter/material.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/res/text_style.dart';

class OrderAppBarWidget extends StatelessWidget {
  const OrderAppBarWidget({Key key}) : super(key: key);

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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * .06),
          Container(
            padding: EdgeInsets.only(bottom: 7),
            child: Text(
              "Orders",
              style: ITTextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:goodfood/generated/i18n.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/res/text_style.dart';

class NoOrdersWidget extends StatelessWidget {
  const NoOrdersWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            I18n.of(context).withoutOrders,
            textAlign: TextAlign.center,
            style: ITTextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ITColors.text),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .07),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * .1),
              Image.asset(
                "assets/images/red_human.png",
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width * .7,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

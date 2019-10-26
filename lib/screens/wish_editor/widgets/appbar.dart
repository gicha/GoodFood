import 'package:flutter/material.dart';
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
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .05),
              child: Text(
                "cancel",
                style: ITTextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * .05),
              child: Text(
                "save",
                style: ITTextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

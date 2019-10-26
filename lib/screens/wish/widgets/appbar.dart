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
        crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * .06),
          Container(
            padding: EdgeInsets.only(bottom: 7),
            child: Text(
              "Wishlist",
              style: ITTextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(bottom: 7),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF2B44FF),
              ),
              child: Icon(
                Icons.add,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * .025),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:goodfood/generated/i18n.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/res/text_style.dart';
import 'package:goodfood/screens/wish_editor/index.dart';
import 'package:page_transition/page_transition.dart';

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
              I18n.of(context).wishlist,
              style: ITTextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: () =>
                Navigator.of(context).push(PageTransition(type: PageTransitionType.fade, child: WishEditorScreen())),
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

import 'package:flutter/material.dart';
import 'package:goodfood/models/models.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/res/text_style.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class WishItemWidget extends StatelessWidget {
  const WishItemWidget({Key key, @required this.wish}) : super(key: key);
  final Wish wish;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 80,
      // width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 30, left: 30, right: 15, bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(wish.category, style: ITTextStyle(fontWeight: FontWeight.bold, color: ITColors.text)),
              SizedBox(height: 10),
              Text('${wish.needCount.floor().toString()} pcs.', style: ITTextStyle(color: ITColors.text)),
            ],
          ),
          // Expanded(child: Container()),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width * .45,
            child: FAProgressBar(
              currentValue: ((wish.existCount / wish.needCount * 100) ?? 0).floor().clamp(20, 100),
              direction: Axis.horizontal,
              progressColor: ITColors.primary,
              backgroundColor: ITColors.bg,
              borderRadius: 45,
              animatedDuration: Duration(milliseconds: 900),
            ),
          ),
        ],
      ),
    );
  }
}

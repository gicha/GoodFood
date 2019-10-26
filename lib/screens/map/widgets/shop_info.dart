import 'package:auto_size_text/auto_size_text.dart';
import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/models/models.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/res/text_style.dart';
import 'package:goodfood/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShopInfo extends StatelessWidget {
  const ShopInfo({Key key, this.shop}) : super(key: key);
  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width - 8,
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * .8,
              child: AutoSizeText(
                '${shop.name}',
                maxFontSize: 16,
                minFontSize: 14,
                maxLines: 2,
                textAlign: TextAlign.start,
                style: ITTextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Text(calculateDistance(), style: ITTextStyle(color: ITColors.secondaryText)),
          Text(shop.address.text, style: ITTextStyle(color: ITColors.secondaryText)),
          // Row(
          //   children: List.generate(
          //     shop.boxes.length,
          //     (index) => Container(
          //       padding: EdgeInsets.all(5),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: <Widget>[
          //           Container(width: 28, height: 28, child: ITIcons.getIcons(shop.boxes[index].type.toLowerCase())),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  String calculateDistance() {
    double distance = Utils.calculateDistance(SelfBloc.getInstance()?.currentState?.position,
        LatLng(shop.address.coordinates.latitude, shop.address.coordinates.longitude));
    if (distance < 1)
      return '${(distance * 1000).floor().toString()} м от вас';
    else
      return '${distance.toStringAsFixed(2)} км от вас';
  }
}

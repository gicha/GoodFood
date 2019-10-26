import 'package:auto_size_text/auto_size_text.dart';
import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/generated/i18n.dart';
import 'package:goodfood/models/models.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/res/text_style.dart';
import 'package:goodfood/screens/map/widgets/product.dart';
import 'package:badges/badges.dart';
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
      padding: EdgeInsets.only(top: 24, bottom: 12, left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .65,
                child: Container(
                  // width: MediaQuery.of(context).size.width * .6,
                  child: AutoSizeText(
                    '${shop.name}',
                    maxFontSize: 16,
                    minFontSize: 13,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: ITTextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .6,
                child: Text(
                  ' ${shop.address.text}',
                  style: ITTextStyle(color: ITColors.secondaryText),
                  maxLines: 1,
                ),
              ),
              Text(calculateDistance(context), style: ITTextStyle(color: ITColors.secondaryText)),
            ],
          ),
          GestureDetector(
            onTap: () => Utils.launchUrl('tel:${(shop.phone ?? "").length == 0 ? "+36(1)700-0020" : shop.phone}'),
            child: Chip(
              backgroundColor: ITColors.primary,
              padding: EdgeInsets.all(8),
              label: Text('CALL', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  String calculateDistance(context) {
    double distance = Utils.calculateDistance(SelfBloc.getInstance()?.currentState?.position,
        LatLng(shop.address.coordinates.latitude, shop.address.coordinates.longitude));
    if (distance < 1)
      return ' ${(distance * 1000).floor().toString()} ${I18n.of(context).metres} ${I18n.of(context).fromYou}';
    else
      return ' ${distance.toStringAsFixed(2)} ${I18n.of(context).kilometres} ${I18n.of(context).fromYou}';
  }
}

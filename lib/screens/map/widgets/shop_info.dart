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
      height: 110,
      width: MediaQuery.of(context).size.width - 8,
      padding: EdgeInsets.only(top: 24, bottom: 0, left: 24, right: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .65,
                child: AutoSizeText(
                  '${shop.name}',
                  maxFontSize: 18,
                  minFontSize: 13,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: ITTextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 17),
              Container(
                width: MediaQuery.of(context).size.width * .6,
                child: AutoSizeText(
                  ' ${shop.address.text}',
                  maxFontSize: 16,
                  minFontSize: 13,
                  style: ITTextStyle(color: ITColors.text),
                  maxLines: 1,
                ),
              ),
              Container(),
            ],
          ),
          Column(
            children: [
              Text(calculateDistance(context), style: ITTextStyle(color: ITColors.secondaryText)),
              SizedBox(height: 5),
              GestureDetector(
                onTap: () => Utils.launchUrl('tel:${(shop.phone ?? "").length == 0 ? "+36(1)700-0020" : shop.phone}'),
                child: Chip(
                  backgroundColor: ITColors.primary,
                  padding: EdgeInsets.all(8),
                  label:
                      Text('call', style: ITTextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String calculateDistance(context) {
    double distance = Utils.calculateDistance(SelfBloc.getInstance()?.currentState?.position,
        LatLng(shop.address.coordinates.latitude, shop.address.coordinates.longitude));
    if (distance < 1)
      return ' ${(distance * 1000).floor().toString()} ${I18n.of(context).metres}';
    else
      return ' ${distance.toStringAsFixed(2)} ${I18n.of(context).kilometres}';
  }
}

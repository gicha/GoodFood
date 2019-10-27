import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goodfood/generated/i18n.dart';
import 'package:goodfood/res/text_style.dart';
import 'package:goodfood/widgets/loading.dart';

/// Splashscreen with loader
/// Displayed when app loading and prepare data
/// Consists of:
/// title from [ITStrings.title]
/// loader widget [ITLoader]
/// {@category Screens}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2E3192),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.asset(
            "assets/images/white_logo.png",
            height: MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width * .3,
          ),
          Container(
            child: Text(
              I18n.of(context).title,
              style: ITTextStyle(fontWeight: FontWeight.normal, fontSize: width * .08, color: Colors.white),
            ),
          ),
          // ITLoading(color: Colors.white)
        ],
      ),
    );
  }
}

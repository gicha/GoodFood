import 'package:flutter/material.dart';
import 'package:goodfood/models/models.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/res/text_style.dart';
import 'package:goodfood/screens/order/widgets/content_item.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({Key key, @required this.order}) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 30, right: 15, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text(
              DateFormat('EEE, MMM d').format(order.date),
              style: ITTextStyle(
                fontWeight: FontWeight.bold,
                color: ITColors.text,
                fontSize: 16,
              ),
            ),
            order.status == "NEW" ? twoButtons(context) : qr(),
          ]),
          SizedBox(height: 10),
          ...List.generate(order.content.length, (index) => ContentItemWidget(content: order.content[index])),
        ],
      ),
    );
  }

  Widget twoButtons(context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2B44FF)),
            child: Icon(Icons.check, size: 35, color: Colors.white),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * .2),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2B44FF)),
            child: Icon(Icons.close, size: 35, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget qr() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2B44FF)),
        child: Icon(LineIcons.qrcode, size: 35, color: Colors.white),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/models/models.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/res/text_style.dart';
import 'package:goodfood/screens/order/widgets/content_item.dart';
import 'package:goodfood/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr/qr.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({Key key, @required this.order}) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 30, right: 15, bottom: 30),
      child: Column(
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                DateFormat('EEE, MMM d').format(order.date),
                style: ITTextStyle(
                  fontWeight: FontWeight.bold,
                  color: ITColors.text,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 30),
              order.status == "NEW" ? twoButtons(context) : qr(context),
            ],
          ),
          //SizedBox(height: 10),
          ...List.generate(order.content.length, (index) => ContentItemWidget(content: order.content[index])),
        ],
      ),
    );
  }

  Widget twoButtons(context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            OrderBloc.getInstance().dispatch(ConfirmOrderEvent(order.id));
          },
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(shape: BoxShape.circle, color: ITColors.primary),
            child: Icon(Icons.check, size: 30, color: Colors.white),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * .1),
        GestureDetector(
          onTap: () {
            OrderBloc.getInstance().dispatch(DeleteOrderEvent(order.id));
          },
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(shape: BoxShape.circle, color: ITColors.primary),
            child: Icon(Icons.close, size: 30, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget qr(context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                //title: Text("QR"),
                content: Container(
                  child: PrettyQr(
                      image: AssetImage('assets/images/logo.png'),
                      typeNumber: 3,
                      size: 230,
                      data: order.qr ?? "qwertyuygfdfghjhgfd",
                      errorCorrectLevel: QrErrorCorrectLevel.M,
                      roundEdges: true),
                ),
              );
            });
      },
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(shape: BoxShape.circle, color: ITColors.primary),
        child: Icon(LineIcons.qrcode, size: 30, color: Colors.white),
      ),
    );
  }
}

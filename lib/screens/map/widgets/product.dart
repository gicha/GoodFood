import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/models/models.dart';
import 'package:flutter/material.dart';
import 'package:goodfood/res/res.dart';
import 'package:goodfood/res/text_style.dart';
import 'package:goodfood/utils/utils.dart';
import 'package:goodfood/widgets/image.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key key, this.product, this.page}) : super(key: key);
  final Product product;
  final int page;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: WishBloc.getInstance(),
        builder: (context, WishState state) {
          return Slidable(
            actionPane: SlidableStrechActionPane(),
            actionExtentRatio: 0.25,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: MediaQuery.of(context).size.width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(children: [
                    Container(
                      width: 60,
                      height: 60,
                      child: ITImage(product.image),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * .05),
                    Container(
                      width: MediaQuery.of(context).size.width * .4,
                      child: AutoSizeText(
                        '${product.name}',
                        maxFontSize: 14,
                        minFontSize: 13,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: ITTextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('${Utils.getDateTimeDifference(product.date)}',
                          style: ITTextStyle(color: ITColors.secondaryText)),
                      Text('${product.count.floor()} pcs.', style: ITTextStyle(color: ITColors.secondaryText)),
                    ],
                  )
                ],
              ),
            ),
            secondaryActions: <Widget>[
              IconSlideAction(
                closeOnTap: false,
                iconWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => WishBloc.getInstance()
                          .dispatch(EditProductWishEvent(product.name, (state.productWishes[product.name] ?? 0) - 1)),
                      child: Container(
                          // padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                          child: Text("-", style: ITTextStyle(fontSize: 50, color: ITColors.bg))),
                    ),
                    SizedBox(width: 5),
                    Text(' ${state.productWishes[product.name] ?? 0} ',
                        style: ITTextStyle(color: Colors.white, fontSize: 25)),
                    SizedBox(width: 5),
                    GestureDetector(
                        onTap: () {
                          WishBloc.getInstance().dispatch(
                              EditProductWishEvent(product.name, (state.productWishes[product.name] ?? 0) + 1));
                        },
                        child: Text("+", style: ITTextStyle(fontSize: 40, color: ITColors.bg))),
                  ],
                ),
                color: ITColors.primary,
              ),
              // IconSlideAction(
              //   caption: 'Delete',
              //   color: ITColors.red,
              //   icon: Icons.delete,
              //   onTap: () => () {},
              // ),
            ],
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/generated/i18n.dart';
import 'package:goodfood/res/res.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:goodfood/res/text_style.dart';

class WishItemWidget extends StatelessWidget {
  const WishItemWidget({Key key, @required this.page}) : super(key: key);
  final int page;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableStrechActionPane(),
      actionExtentRatio: 0.25,
      child: Card(
        color: Colors.white,
        elevation: 3,
        margin: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Form(
            onWillPop: () async {
              return true;
            },
            child: FormBuilder(
              onWillPop: () async => true,
              onChanged: (input) {
                WishBloc.getInstance().dispatch(EditWishEvent(page, input["name"], input["count"]));
              },
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    attribute: "name",
                    decoration: InputDecoration(
                      labelText: "Product Name",
                      hintText: "Input your wish here",
                      border: InputBorder.none,
                      labelStyle: ITTextStyle(fontSize: 22),
                    ),
                    maxLines: 1,
                    style: ITTextStyle(fontSize: 20),
                    validators: [FormBuilderValidators.required()],
                  ),
                  FormBuilderTextField(
                    attribute: "count",
                    decoration: InputDecoration(
                      labelText: "Amount",
                      hintText: "Input number",
                      border: InputBorder.none,
                      labelStyle: ITTextStyle(fontSize: 22),
                    ),
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    style: ITTextStyle(fontSize: 20),
                    validators: [
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.max(100),
                      FormBuilderValidators.min(1),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: I18n.of(context).delete,
          color: ITColors.red,
          icon: Icons.delete,
          closeOnTap: false,
          onTap: () => WishBloc.getInstance().dispatch(DeleteWishEvent(page)),
        ),
      ],
    );
  }
}

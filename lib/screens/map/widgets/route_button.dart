import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodfood/blocs/blocs.dart';
import 'package:goodfood/res/res.dart';
import 'package:flutter/material.dart';

class RouteButton extends StatelessWidget {
  const RouteButton({Key key, this.onTap}) : super(key: key);
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap != null ? onTap() : () => {},
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(shape: BoxShape.circle, color: ITColors.bgLight, boxShadow: [
          BoxShadow(color: ITColors.secondaryText.withOpacity(.6), blurRadius: 5.0),
        ]),
        child: Center(
          child: BlocBuilder(
              bloc: ShopBloc.getInstance(),
              builder: (context, ShopState state) {
                return state.route != null
                    ? Icon(Icons.clear, color: ITColors.primary)
                    : Icon(Icons.directions, color: ITColors.primary);
              }),
        ),
      ),
    );
  }
}

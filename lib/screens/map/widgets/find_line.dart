// import 'package:goodfood/blocs/blocs.dart';
// import 'package:goodfood/res/res.dart';
// import 'package:goodfood/res/text_style.dart';
// import 'package:goodfood/screens/filter/filter_screen.dart';
// import 'package:goodfood/screens/map/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:page_transition/page_transition.dart';

// class FinLineView extends StatefulWidget {
//   const FinLineView({Key key, @required this.provider}) : super(key: key);
//   final MapProvider provider;

//   @override
//   _FinLineViewState createState() => _FinLineViewState();
// }

// class _FinLineViewState extends State<FinLineView> {
//   MapProvider get provider => widget.provider;
//   StoreBloc get shopBloc => provider.shopBloc;
//   double get width => MediaQuery.of(context).size.width;
//   double get height => MediaQuery.of(context).size.height;
//   TextEditingController get findController => provider.findController;

//   FocusNode _focusNode = FocusNode();

//   Widget build(BuildContext context) {
//     return BlocBuilder(
//         bloc: shopBloc,
//         builder: (context, StoreState state) {
//           return Card(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             color: Colors.white,
//             elevation: 1,
//             child: Container(
//               width: width * 0.9,
//               margin: EdgeInsets.only(left: width * .05, right: width * .015, top: 5, bottom: 5),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: width * .7,
//                     child: TextField(
//                       controller: findController,
//                       focusNode: _focusNode,
//                       minLines: 1,
//                       onEditingComplete: () => afterInput(),
//                       autofocus: false,
//                       decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'Построить маршрут через контейнер',
//                           labelStyle: ITTextStyle(),
//                           hintStyle: ITTextStyle(color: ITColors.secondaryText)),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () => afterInput(),
//                     child: Container(
//                       width: width * .1,
//                       height: width * .1,
//                       child: shopBloc.currentState.buildingRoute
//                           ? Container(
//                               padding: EdgeInsets.all(8),
//                               child: CircularProgressIndicator(
//                                 valueColor: AlwaysStoppedAnimation<Color>(ITColors.primary),
//                               ),
//                             )
//                           : Icon(
//                               LineIcons.search,
//                               color: ITColors.secondaryText,
//                             ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () => Navigator.of(context).push(PageTransition(
//                         type: PageTransitionType.fade,
//                         child: FilterScreen(
//                           shopBloc: shopBloc,
//                           onChange: provider.onCameraIdle,
//                         ))),
//                     child: Container(
//                       width: width * .1,
//                       height: width * .1,
//                       child: shopBloc.currentState.types.length == 0
//                           ? Container(
//                               padding: EdgeInsets.all(8),
//                               child: CircularProgressIndicator(
//                                 valueColor: AlwaysStoppedAnimation<Color>(ITColors.primary),
//                               ),
//                             )
//                           : Icon(
//                               LineIcons.filter,
//                               color: ITColors.secondaryText,
//                             ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   afterInput() {
//     _focusNode.unfocus();
//     provider.shopBloc.dispatch(BuildRouteEvent(provider.selfBloc.currentState.position, findController.value.text));
//   }
// }

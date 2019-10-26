// import 'package:goodfood/blocs/blocs.dart';
// import 'package:goodfood/generated/i18n.dart';
// import 'package:goodfood/models/models.dart';
// import 'package:goodfood/res/res.dart';
// import 'package:goodfood/res/text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class FilterScreen extends StatefulWidget {
//   const FilterScreen({Key key, this.receiverBloc, this.onChange}) : super(key: key);

//   final ShopBloc receiverBloc;
//   final Function onChange;

//   @override
//   _FilterScreenState createState() => _FilterScreenState();
// }

// class _FilterScreenState extends State<FilterScreen> {
//   ShopBloc get receiverBloc => widget.receiverBloc;
//   Function get onChange => widget.onChange;
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder(
//       bloc: receiverBloc,
//       builder: (
//         BuildContext context,
//         ShopState currentState,
//       ) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(
//               I18n.of(context).filter,
//               style: ITTextStyle(color: ITColors.text),
//             ),
//             iconTheme: IconThemeData(color: ITColors.text),
//             backgroundColor: ITColors.bg,
//           ),
//           body: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 for (ShopType type in currentState.types)
//                   ListTile(
//                     title: Text(type.title),
//                     trailing: Checkbox(
//                       activeColor: ITColors.primary,
//                       value: currentState.filter.contains(type),
//                       onChanged: (val) {
//                         List<ShopType> newFilter = currentState.filter;
//                         if (val)
//                           newFilter.add(type);
//                         else
//                           newFilter.remove(type);
//                         receiverBloc.dispatch(SetFilterEvent(newFilter));
//                         onChange();
//                       },
//                     ),
//                   )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

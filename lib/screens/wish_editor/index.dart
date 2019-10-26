import 'package:goodfood/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:goodfood/screens/wish_editor/provider.dart';

import 'view/index.dart';

/// WishEditor Screen
/// {@category Screens}
class WishEditorScreen extends StatefulWidget {
  @override
  _WishEditorScreenState createState() => _WishEditorScreenState();
}

class _WishEditorScreenState extends State<WishEditorScreen> {
  // blocs
  WishBloc wishBloc;
  //other

  WishEditorProvider provider;

  @override
  void initState() {
    wishBloc = WishBloc.getInstance();
    provider = WishEditorProvider(wishBloc: wishBloc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WishEditorView(provider: provider);
  }
}

import 'dart:async';

import 'package:goodfood/blocs/blocs.dart';
import 'package:flutter/material.dart';

class WishEditorProvider {
  WishEditorProvider({@required this.wishBloc});

  // blocs
  final WishBloc wishBloc;
}

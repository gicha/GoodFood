import 'dart:async';

import 'package:goodfood/blocs/blocs.dart';
import 'package:flutter/material.dart';

class WishProvider {
  WishProvider({@required this.wishBloc, @required this.scrollController});

  // blocs
  final WishBloc wishBloc;
  final ScrollController scrollController;
}

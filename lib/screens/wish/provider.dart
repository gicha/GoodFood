import 'dart:async';

import 'package:goodfood/api/api.dart';
import 'package:goodfood/blocs/blocs.dart';
import 'package:flutter/material.dart';

class WishProvider {
  WishProvider({@required this.wishBloc});

  // blocs
  final WishBloc wishBloc;
}

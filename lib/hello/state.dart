import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

import '../global_store/state.dart';

class HelloState implements GlobalBaseState, Cloneable<HelloState> {
  @override
  Color themeColor;

  @override
  HelloState clone() {
    return HelloState()
      ..themeColor = themeColor;
  }

}
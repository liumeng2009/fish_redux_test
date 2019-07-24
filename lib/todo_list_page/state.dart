import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

import '../global_store/state.dart';
import 'todo_component/component.dart';
import 'report_component/component.dart';

class PageState implements GlobalBaseState, Cloneable<PageState> {
  List<ToDoState> toDos;

  @override
  Color themeColor;

  @override
  PageState clone() {
    return PageState()
      ..themeColor = themeColor
      ..toDos = toDos;
  }
}

PageState initState(Map<String, dynamic> args) {
  return PageState();
}

class ReportConnector extends Reselect2<PageState, ReportState, int, int> {
  @override
  ReportState computed(int sub0, int sub1) {
    return ReportState()
      ..done = sub0
      ..total = sub1;
  }

  @override
  int getSub0(PageState state) {
    return state.toDos.where((ToDoState tds) => tds.isDone).toList().length;
  }

  @override
  int getSub1(PageState state) {
    return state.toDos.length;
  }

  @override
  void set(PageState state, ReportState subState) {
    throw Exception('Unexpected to set PageState from ReportState');
  }

}
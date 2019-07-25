import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import '../global_store/state.dart';
import '../todo_list_page/todo_component/component.dart';

class ToDoEditState implements GlobalBaseState, Cloneable<ToDoEditState> {
  ToDoState toDo;

  TextEditingController nameEditController;
  TextEditingController descEditController;

  FocusNode focusNodeName;
  FocusNode focusNodeDesc;

  @override
  Color themeColor;

  @override
  ToDoEditState clone() {
    return ToDoEditState()
      ..nameEditController = nameEditController
      ..descEditController = descEditController
      ..focusNodeName = focusNodeName
      ..focusNodeDesc = focusNodeDesc
      ..toDo = toDo
      ..themeColor = themeColor;
  }
}

ToDoEditState initState(ToDoState arg) {
  final ToDoEditState state = ToDoEditState();
  state.toDo = arg?.clone() ?? ToDoState();
  state.nameEditController = TextEditingController(text: arg?.title);
  state.descEditController = TextEditingController(text: arg?.desc);
  state.focusNodeName = FocusNode();
  state.focusNodeDesc = FocusNode();

  return state;
}

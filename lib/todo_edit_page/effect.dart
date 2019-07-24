import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';
import 'action.dart';

import '../global_store/store.dart';
import '../global_store/action.dart';

import '../todo_list_page/todo_component/component.dart';

Effect<ToDoEditState> buildEffect() {
  return combineEffects(<Object, Effect<ToDoEditState>>{
    Lifecycle.initState: _init,
    ToDoEditAction.onDone: _onDone,
    ToDoEditAction.onChangeTheme: _onChangeTheme,
  });
}

void _init(Action action, Context<ToDoEditState> ctx) {
  ctx.state.nameEditController.addListener(() {
    ctx.dispatch(
      ToDoEditActionCreator.update(ctx.state.nameEditController.text, null)
    );
  });
  ctx.state.descEditController.addListener(() {
    ctx.dispatch(
      ToDoEditActionCreator.update(ctx.state.descEditController.text, null)
    );
  });
}

void _onDone(Action action, Context<ToDoEditState> ctx) {
  Navigator.of(ctx.context).pop<ToDoState>(ctx.state.toDo);
}

void _onChangeTheme(Action action, Context<ToDoEditState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.changeThemeColor());
}
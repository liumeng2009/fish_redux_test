import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';
import 'action.dart';

Effect<ToDoState> buildEffect() {
  return combineEffects(<Object, Effect<ToDoState>>{
    ToDoAction.onEdit: _onEdit,
    ToDoAction.onRemove: _onRemove,
  });
}

void _onEdit(Action action, Context<ToDoState> ctx) {
  if(action.payload == ctx.state.uniqueId) {
    Navigator.of(ctx.context)
      .pushNamed('todo_edit', arguments: ctx.state)
      .then((dynamic toDo){
        ctx.dispatch(ToDoActionCreator.editAction(toDo));
      });
  }
}

void _onRemove(Action action, Context<ToDoState> ctx) async {
  final String select = await showDialog<String>(
    context: ctx.context,
    builder: (BuildContext buildContext) {
      return AlertDialog(
        title: Text('Are you sure to delete "${ctx.state.title}"?'),
        actions: <Widget>[
          GestureDetector(
            child: const Text(
              'Cancel',
              style: TextStyle(fontSize: 16.0),
            ),
            onTap: () => Navigator.of(buildContext).pop(),
          ),
          GestureDetector(
            child: const Text(
              'Yes',
              style: TextStyle(fontSize: 16.0),
            ),
            onTap: () => Navigator.of(buildContext).pop('Yes')
          ),
        ],
      );
    },
  );
  if(select == 'Yes') {
    ctx.dispatch(ToDoActionCreator.removeAction(ctx.state.uniqueId));
  }
}
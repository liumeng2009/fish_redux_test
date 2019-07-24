import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';
import 'action.dart';

import 'list_adapter/action.dart';
import 'todo_component/component.dart';

Effect<PageState> buildEffect() {
  return combineEffects(<Object, Effect<PageState>>{
    Lifecycle.initState: _init,
    HelloAction.onAdd: _onAdd,
  });
}

void _init(Action action, Context<PageState> ctx) {
  final List<ToDoState> initToDos = <ToDoState>[
    ToDoState(
      uniqueId: '0',
      title: 'Hello world',
      desc: 'Learn how to program.',
      isDone: true,
    ),
    ToDoState(
      uniqueId: '1',
      title: 'Hello Flutter',
      desc: 'Learn how to build a flutter application.',
      isDone: true,
    ),
    ToDoState(
      uniqueId: '2',
      title: 'How Fish Redux',
      desc: 'Learn how to use Fish Redux in a flutter application.',
      isDone: false,
    )
  ];

  ctx.dispatch(HelloActionCreator.initToDosAction(initToDos));
}

void _onAdd(Action action, Context<PageState> ctx) {
  Navigator.of(ctx.context)
    .pushNamed('todo_edit', arguments: null)
    .then((dynamic toDo) {
      if(toDo != null && (toDo.title?.isNotEmpty == true || toDo.desc?.isNotEmpty == true)){
        ctx.dispatch(ToDoListActionCreator.add(toDo));
      }
    });
}
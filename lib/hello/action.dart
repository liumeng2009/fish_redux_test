import 'package:fish_redux/fish_redux.dart';

import 'todo_component/component.dart';

enum HelloAction { initToDos, onAdd }

class HelloActionCreator {
  static Action initToDosAction(List<ToDoState> toDos) {
    return const Action(HelloAction.initToDos, payload: toDos);
  }
  static Action onAddAction() {
    return const Action(HelloAction.onAdd);
  }
}
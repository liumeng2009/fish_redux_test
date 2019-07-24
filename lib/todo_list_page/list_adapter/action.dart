import 'package:fish_redux/fish_redux.dart';
import '../todo_component/state.dart';

enum ToDoListAction { add }

class ToDoListActionCreator {
  static Action add(ToDoState state) {
    return Action(ToDoListAction.add, payload: state);
  }
}
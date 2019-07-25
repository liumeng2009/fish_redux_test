import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'view.dart';
import 'state.dart';

import '../todo_list_page/todo_component/component.dart';

class ToDoEditPage extends Page<ToDoEditState, ToDoState> {
  ToDoEditPage()
    : super(
      initState: initState,
      effect: buildEffect(),
      reducer: buildReducer(),
      view: buildView,
    );
}

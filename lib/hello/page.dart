import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';
import 'effect.dart';

class HelloPage extends Page<HelloState, Map<String, dynamic>> {
  HelloPage()
    : super(
      initState: initState,
      effect: buildEffect(),
      view: buildView,
    );
}
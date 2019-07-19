import 'package:fish_redux/fish_redux.dart';

enum HelloAction { onChangeTheme }

class HelloActionCreator {
  static Action onChangeTheme() {
    return const Action(HelloAction.onChangeTheme);
  }
}
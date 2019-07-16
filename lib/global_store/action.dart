import 'package:fish_redux/fish_redux.dart';

enum GlobalAction { changeThemeColor }

class GlobalActionCreator {
  static Action changeThemeColor() {
    return const Action(GlobalAction.changeThemeColor);
  }
}
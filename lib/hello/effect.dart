import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'action.dart';

import '../global_store/store.dart';
import '../global_store/action.dart';

Effect<HelloState> buildEffect() {
  return combineEffects(<Object, Effect<HelloState>>{
    HelloAction.onChangeTheme: _onChangeTheme,
  });
}

void _onChangeTheme(Action action, Context<HelloState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.changeThemeColor());
}
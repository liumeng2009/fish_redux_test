import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';
import 'action.dart';

Widget buildView(
    HelloState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: state.themeColor,
      title: const Text('hello'),
    ),
    body: Center(
      child: const Text('hello'),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        dispatch(HelloActionCreator.onChangeTheme());
      },
      child: Icon(Icons.cached),
    ),
  );
}
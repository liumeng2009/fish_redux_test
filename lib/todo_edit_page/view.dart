import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';
import 'action.dart';

Widget buildView(
  ToDoEditState state, Dispatch dispatch, ViewService viewService
) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: state.themeColor,
      title: const Text('ToDo'),
    ),
    body: Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: const Text(
                    'title',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                  width: 56.0,
                  alignment: AlignmentDirectional.topEnd,
                ),
                Expanded(
                  child: Container(
                    color: const Color(0XFFE0E0E0),
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.only(left: 8.0),
                    child: EditableText(
                      controller: state.nameEditController,
                      focusNode: state.focusNodeName,
                      autofocus: true,
                      style: const TextStyle(color: Colors.black, fontSize: 16.0),
                      cursorColor: Colors.yellow,
                      backgroundCursorColor: const Color(0XFFFFF59D),
                    ),
                  ),
                ),
              ],
            ),
          ),
          RaisedButton(
            padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
            color: Colors.blue,
            child: const Text(
              'Change Theme',
              style: TextStyle(fontSize: 18.0),
              overflow: TextOverflow.ellipsis,
            ),
            onPressed: () {
              dispatch(ToDoEditActionCreator.onChangeTheme());
            },
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 32.0),
              alignment: AlignmentDirectional.topStart,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: const Text(
                      'desc',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                    width: 56.0,
                    alignment: AlignmentDirectional.topEnd,
                  ),
                  Expanded(
                    child: Container(
                      color: const Color(0XFFE0E0E0),
                      padding: const EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(left: 8.0),
                      child: EditableText(
                        controller: state.descEditController,
                        focusNode: state.focusNodeName,
                        autofocus: true,
                        style: const TextStyle(color: Colors.black, fontSize: 16.0),
                        cursorColor: Colors.yellow,
                        backgroundCursorColor: const Color(0XFFE0E0E0),
                        maxLines: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => dispatch(ToDoEditActionCreator.onDone()),
      tooltip: 'Done',
      child: const Icon(Icons.done),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  );
}
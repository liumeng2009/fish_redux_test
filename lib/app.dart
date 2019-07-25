import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'global_store/store.dart';
import 'global_store/state.dart';
import 'todo_list_page/page.dart';
import 'todo_edit_page/page.dart';

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'todo_list': ToDoListPage(),
      'todo_edit': ToDoEditPage(),
    },
    visitor: (String path, Page<Object, dynamic> page) {
      /// 只有特定的范围的Page才需要建立和AppStore的连接关系
      /// 满足Page<T> T 是GlobalBaseState的之类
      if (page.isTypeof<GlobalBaseState>()) {
        /// 建立AppStore驱动PageStore的单项数据连接
        /// 1. 参数1 AppStore
        /// 2. 参数2 当 AppStore.state 变化时, PageStore.state 该如何变化
        page.connectExtraStore<GlobalState>(
          GlobalStore.store,
          (Object pagestate, GlobalState appState) {
            final GlobalBaseState p = pagestate;
            if (p.themeColor != appState.themeColor) {
              if (pagestate is Cloneable) {
                final Object copy = pagestate.clone();
                final GlobalBaseState newState = copy;
                newState.themeColor = appState.themeColor;
                return newState;
              }
            }
            return pagestate;
          },
        );
      }

      // AOP
      page.enhancer.append(
        viewMiddleware: <ViewMiddleware<dynamic>>[
          safetyView<dynamic>(),
        ],

        adapterMiddleware: <AdapterMiddleware<dynamic>>[
          safetyAdapter<dynamic>(),
        ],

        effectMiddleware: [
          _pageAnalyticsMiddleware<dynamic>(),
        ],

        middleware: <Middleware<dynamic>>[
          logMiddleware<dynamic>(tag: page.runtimeType.toString()),
        ],
      );

    }
  );

  return MaterialApp(
    title: 'Fluro',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: routes.buildPage('todo_list', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}

EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
          print('${logic.runtimeType} ${action.type.toString()} ');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}

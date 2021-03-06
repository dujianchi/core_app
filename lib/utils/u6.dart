import 'package:flutter/material.dart';

/// ui route stack
///  short name 'ui stack'
///   short short name 'u6'
class App extends NavigatorObserver {
  static final App _instance = App._internal();
  App._internal();
  factory App() => _instance;

  static final List<Route> _routes = List();
  
  static NavigatorObserver get instance => _instance;
  static List<Route> get routes => _routes;
  static NavigatorState get nav => _instance.navigator;

  static bool closeTopDialog() {
    bool result = false;
    if (_routes.isNotEmpty) {
      for (var index = _routes.length - 1; index >= 0; index--) {
        var route = _routes[index];
        var entrite = route?.overlayEntries;
        if (entrite?.isNotEmpty == true) {
          var entry = entrite?.first;
          if (entry?.opaque == false) {
            try {
              nav.maybePop();
            } catch (e) {
              //print('$e');
            }
            result = true;
            break;
          }
        }
      }
    }
    return result;
  }

  static void exit() {
    bool isBottom = false;
    while (_routes.isNotEmpty && !isBottom) {
      var route = _routes.last;
      isBottom = route.isFirst;
      try {
        nav.maybePop();
      } catch (e) {
        //print('$e');
      }
      _routes.remove(route);
    }
  }

  /// push
  static Future<T> push<T extends Object>({
    Route<T> route,
    Widget next,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    Route<T> need;
    if (route != null) {
      need = route;
    } else if (next != null) {
      need = MaterialPageRoute<T>(
        builder: (context) => next,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
      );
    }
    return need != null ? nav.push(need) : null;
  }

  /// push
  static Future<T> pushReplacement<T extends Object, TO extends Object>({
    Route<T> route,
    Widget next,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    TO result,
  }) {
    Route<T> need;
    if (route != null) {
      need = route;
    } else if (next != null) {
      need = MaterialPageRoute<T>(
        builder: (context) => next,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
      );
    }
    return need != null ? nav.pushReplacement(need, result: result) : null;
  }

  @override
  void didPop(Route route, Route previousRoute) {
    //print('didPop start -> route.length = ${_routes.length}');
    _routes.remove(route);
    //print('didPop done  -> route.length = ${_routes.length}');
  }

  @override
  void didPush(Route route, Route previousRoute) {
    //print('didPush start -> route.length = ${_routes.length}');
    _routes.add(route);
    //print('didPush done  -> route.length = ${_routes.length}');
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    //print('didRemove start -> route.length = ${_routes.length}');
    _routes.remove(route);
    //print('didRemove done  -> route.length = ${_routes.length}');
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    //print('didReplace start -> route.length = ${_routes.length}');
    final start = _routes.indexOf(oldRoute);
    if (start >= 0) {
      _routes.replaceRange(start, start + 1, [newRoute]);
    } else {
      _routes.add(newRoute);
    }
    //print('didReplace done  -> route.length = ${_routes.length}');
  }
}

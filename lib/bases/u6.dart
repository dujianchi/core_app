import 'package:flutter/material.dart';

/// ui route stack
///  short name 'ui stack'
///   short short name 'u6'
class U6 extends NavigatorObserver {
  static final U6 _instance = U6._internal();
  U6._internal();
  factory U6() => _instance;

  static final List<Route> _routes = List();
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
              print('$e');
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
        print('$e');
      }
    }
  }

  @override
  void didPop(Route route, Route previousRoute) {
    print('didPop -> route = $route, previousRoute = $previousRoute');
    _routes.remove(route);
  }

  @override
  void didPush(Route route, Route previousRoute) {
    print('didPush -> route = $route, previousRoute = $previousRoute');
    _routes.add(route);
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    print('didRemove -> route = $route, previousRoute = $previousRoute');
    _routes.remove(route);
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    print('didReplace -> newRoute = $newRoute, oldRoute = $oldRoute');
    final start = _routes.indexOf(oldRoute);
    if (start >= 0) {
      _routes.replaceRange(start, start + 1, [newRoute]);
    } else {
      _routes.add(newRoute);
    }
  }
}

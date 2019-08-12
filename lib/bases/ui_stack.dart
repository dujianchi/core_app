import 'package:flutter/material.dart';

class UiStack extends NavigatorObserver {
  
  static final UiStack _instance = UiStack._internal();
  static final List<Route> _routes = List();
  UiStack._internal();
  factory UiStack() => _instance;

  static List<Route> get routes => _routes;

  static bool closeTopDialog(BuildContext context){
    bool result = false;
    if (_routes.isNotEmpty){
      var route = _routes.last;
      var entrite = route.overlayEntries;
      if (entrite.isNotEmpty){
        var entry = entrite.first;
        if (!entry.opaque) {
          Navigator.of(context).maybePop();
          result = true;
      }
    }
    return result;
  }

  @override
  void didPop(Route route, Route previousRoute) {
    _routes.remove(route);
  }

  @override
  void didPush(Route route, Route previousRoute) {
    _routes.add(route);
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    _routes.remove(route);
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    final start = _routes.indexOf(oldRoute);
    if (start >= 0) {
      _routes.replaceRange(start, start + 1, [newRoute]);
    } else {
      _routes.add(newRoute);
    }
  }

  @override
  void didStartUserGesture(Route route, Route previousRoute) {}

  @override
  void didStopUserGesture() {}
}

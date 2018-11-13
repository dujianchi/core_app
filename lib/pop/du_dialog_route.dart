library dudialog;

import 'package:flutter/widgets.dart';

class DuDialogRoute<T> extends PopupRoute<T> {
  DuDialogRoute({
    @required RoutePageBuilder pageBuilder,
    RouteSettings settings,
  })  : _pageBuilder = pageBuilder,
        super(settings: settings);

  final RoutePageBuilder _pageBuilder;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Color get barrierColor => const Color(0x01000000); //can't not be transparent

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new Semantics(
      child: _pageBuilder(context, animation, secondaryAnimation),
      scopesRoute: true,
      explicitChildNodes: true,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      FadeTransition(
          opacity: new CurvedAnimation(
            parent: animation,
            curve: Curves.linear,
          ),
          child: child);
}

import 'package:core_app/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DuMain extends DuStatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget body;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final FloatingActionButtonAnimator floatingActionButtonAnimator;
  final List<Widget> persistentFooterButtons;
  final Widget drawer;
  final Widget endDrawer;
  final Widget bottomNavigationBar;
  final Widget bottomSheet;
  final Color backgroundColor;
  final bool resizeToAvoidBottomPadding;
  final bool resizeToAvoidBottomInset;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Color drawerScrimColor;
  final double drawerEdgeDragWidth;

  DuMain({
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomPadding,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
  });

  @override
  Widget build(BuildContext context) => BaseMaterialApp(
        navigatorObservers: [U6()],
        home: Scaffold(
          appBar: appBar,
          body: body,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          persistentFooterButtons: persistentFooterButtons,
          drawer: drawer,
          endDrawer: endDrawer,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomPadding: resizeToAvoidBottomPadding,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          primary: primary,
          drawerDragStartBehavior: drawerDragStartBehavior,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          drawerScrimColor: drawerScrimColor,
          drawerEdgeDragWidth: drawerEdgeDragWidth,
        ),
      );
}

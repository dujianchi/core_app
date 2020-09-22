import 'dart:math';

import 'package:core_app/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// 作为主要的界面，继承于StatelessWidget
abstract class DuPage extends DuStatelessWidget with DuScaffoldMethod {
  DuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        key: scaffoldKey,
        appBar: buildAppBar(context),
        body: buildChild(context),
        floatingActionButton: floatingActionButton(context),
        floatingActionButtonLocation: floatingActionButtonLocation(context),
        floatingActionButtonAnimator: floatingActionButtonAnimator(context),
        persistentFooterButtons: persistentFooterButtons(context),
        drawer: drawer(context),
        endDrawer: endDrawer(context),
        bottomNavigationBar: bottomNavigationBar(context),
        bottomSheet: bottomSheet(context),
        backgroundColor: backgroundColor(context),
        resizeToAvoidBottomPadding: resizeToAvoidBottomPadding(context),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset(context),
        primary: primary(context),
        drawerDragStartBehavior: drawerDragStartBehavior(context),
        extendBody: extendBody(context),
        extendBodyBehindAppBar: extendBodyBehindAppBar(context),
        drawerScrimColor: drawerScrimColor(context),
        drawerEdgeDragWidth: drawerEdgeDragWidth(context),
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture(context),
        endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture(context),
      );

  /// build child
  Widget buildChild(BuildContext context);

  // ------------ 这么一大段，没有实际意义，只是为了让vscode更好重写对应方法 (begin) ------------
  @override
  PreferredSizeWidget buildAppBar(BuildContext context) =>
      super.buildAppBar(context);

  @override
  Widget floatingActionButton(BuildContext context) =>
      super.floatingActionButton(context);
  @override
  FloatingActionButtonLocation floatingActionButtonLocation(
          BuildContext context) =>
      super.floatingActionButtonLocation(context);
  @override
  FloatingActionButtonAnimator floatingActionButtonAnimator(
          BuildContext context) =>
      super.floatingActionButtonAnimator(context);
  @override
  List<Widget> persistentFooterButtons(BuildContext context) =>
      super.persistentFooterButtons(context);
  @override
  Widget drawer(BuildContext context) => super.drawer(context);
  @override
  Widget endDrawer(BuildContext context) => super.endDrawer(context);
  @override
  Widget bottomNavigationBar(BuildContext context) =>
      super.bottomNavigationBar(context);
  @override
  Widget bottomSheet(BuildContext context) => super.bottomSheet(context);
  @override
  Color backgroundColor(BuildContext context) => super.backgroundColor(context);
  @override
  bool resizeToAvoidBottomPadding(BuildContext context) =>
      super.resizeToAvoidBottomPadding(context);
  @override
  bool resizeToAvoidBottomInset(BuildContext context) =>
      super.resizeToAvoidBottomInset(context);
  @override
  bool primary(BuildContext context) => super.primary(context);
  @override
  DragStartBehavior drawerDragStartBehavior(BuildContext context) =>
      super.drawerDragStartBehavior(context);
  @override
  bool extendBody(BuildContext context) => super.extendBody(context);
  @override
  bool extendBodyBehindAppBar(BuildContext context) =>
      super.extendBodyBehindAppBar(context);
  @override
  Color drawerScrimColor(BuildContext context) =>
      super.drawerScrimColor(context);
  @override
  double drawerEdgeDragWidth(BuildContext context) =>
      super.drawerEdgeDragWidth(context);
  @override
  bool drawerEnableOpenDragGesture(BuildContext context) =>
      super.drawerEnableOpenDragGesture(context);
  @override
  bool endDrawerEnableOpenDragGesture(BuildContext context) =>
      super.endDrawerEnableOpenDragGesture(context);
  // ------------ 这么一大段，没有实际意义，只是为了让vscode更好重写对应方法 (end) ------------
}

/// 作为主要的state类继承于State
abstract class DuState<T extends DuStatefulWidget> extends State<T>
    with DuScaffoldMethod
    implements Toast {
  @override
  Widget build(BuildContext context) => Scaffold(
        key: widget.scaffoldKey,
        appBar: buildAppBar(context),
        body: buildChild(context),
        floatingActionButton: floatingActionButton(context),
        floatingActionButtonLocation: floatingActionButtonLocation(context),
        floatingActionButtonAnimator: floatingActionButtonAnimator(context),
        persistentFooterButtons: persistentFooterButtons(context),
        drawer: drawer(context),
        endDrawer: endDrawer(context),
        bottomNavigationBar: bottomNavigationBar(context),
        bottomSheet: bottomSheet(context),
        backgroundColor: backgroundColor(context),
        resizeToAvoidBottomPadding: resizeToAvoidBottomPadding(context),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset(context),
        primary: primary(context),
        drawerDragStartBehavior: drawerDragStartBehavior(context),
        extendBody: extendBody(context),
        extendBodyBehindAppBar: extendBodyBehindAppBar(context),
        drawerScrimColor: drawerScrimColor(context),
        drawerEdgeDragWidth: drawerEdgeDragWidth(context),
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture(context),
        endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture(context),
      );

  @override
  void toastSnackBar({
    SnackBar snackBar,
    Widget content,
    String text,
    Color backgroundColor,
    double elevation,
    EdgeInsetsGeometry margin,
    EdgeInsetsGeometry padding,
    double width,
    ShapeBorder shape,
    SnackBarBehavior behavior,
    SnackBarAction action,
    Duration duration,
    Animation<double> animation,
    VoidCallback onVisible,
    String hideStr,
  }) {
    widget.toastSnackBar(
      snackBar: snackBar,
      content: content,
      text: text,
      backgroundColor: backgroundColor,
      elevation: elevation,
      margin: margin,
      padding: padding,
      width: width,
      shape: shape,
      behavior: behavior,
      action: action,
      duration: duration,
      animation: animation,
      onVisible: onVisible,
      hideStr: hideStr,
    );
  }

  /// build child
  Widget buildChild(BuildContext context);

  // ------------ 这么一大段，没有实际意义，只是为了让vscode更好重写对应方法 (begin) ------------
  @override
  PreferredSizeWidget buildAppBar(BuildContext context) =>
      super.buildAppBar(context);

  @override
  Widget floatingActionButton(BuildContext context) =>
      super.floatingActionButton(context);
  @override
  FloatingActionButtonLocation floatingActionButtonLocation(
          BuildContext context) =>
      super.floatingActionButtonLocation(context);
  @override
  FloatingActionButtonAnimator floatingActionButtonAnimator(
          BuildContext context) =>
      super.floatingActionButtonAnimator(context);
  @override
  List<Widget> persistentFooterButtons(BuildContext context) =>
      super.persistentFooterButtons(context);
  @override
  Widget drawer(BuildContext context) => super.drawer(context);
  @override
  Widget endDrawer(BuildContext context) => super.endDrawer(context);
  @override
  Widget bottomNavigationBar(BuildContext context) =>
      super.bottomNavigationBar(context);
  @override
  Widget bottomSheet(BuildContext context) => super.bottomSheet(context);
  @override
  Color backgroundColor(BuildContext context) => super.backgroundColor(context);
  @override
  bool resizeToAvoidBottomPadding(BuildContext context) =>
      super.resizeToAvoidBottomPadding(context);
  @override
  bool resizeToAvoidBottomInset(BuildContext context) =>
      super.resizeToAvoidBottomInset(context);
  @override
  bool primary(BuildContext context) => super.primary(context);
  @override
  DragStartBehavior drawerDragStartBehavior(BuildContext context) =>
      super.drawerDragStartBehavior(context);
  @override
  bool extendBody(BuildContext context) => super.extendBody(context);
  @override
  bool extendBodyBehindAppBar(BuildContext context) =>
      super.extendBodyBehindAppBar(context);
  @override
  Color drawerScrimColor(BuildContext context) =>
      super.drawerScrimColor(context);
  @override
  double drawerEdgeDragWidth(BuildContext context) =>
      super.drawerEdgeDragWidth(context);
  @override
  bool drawerEnableOpenDragGesture(BuildContext context) =>
      super.drawerEnableOpenDragGesture(context);
  @override
  bool endDrawerEnableOpenDragGesture(BuildContext context) =>
      super.endDrawerEnableOpenDragGesture(context);
  // ------------ 这么一大段，没有实际意义，只是为了让vscode更好重写对应方法 (end) ------------
}

///作为默认主页样式
abstract class DuPageBottomNav extends DuPage {
  DuPageBottomNav({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length:
            min(tabChildren(context).length, tabViewChildren(context).length),
        child: super.build(context),
      );

  @override
  Widget bottomNavigationBar(context) => Material(
        color:
            bottomNavigationBarColor(context) ?? Theme.of(context).primaryColor,
        child: TabBar(
          tabs: tabChildren(context),
        ),
      );

  @override
  Widget buildChild(BuildContext context) => TabBarView(
        children: tabViewChildren(context),
      );

  //tab按钮颜色(位于底部)
  Color bottomNavigationBarColor(BuildContext context) => Colors.white70;

  /// tab内容布局(位于上部)
  List<Widget> tabViewChildren(BuildContext context);

  /// tab按钮布局(位于底部)
  List<Widget> tabChildren(BuildContext context);
}

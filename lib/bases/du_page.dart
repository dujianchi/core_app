import 'dart:math';

import 'package:core_app/core.dart';
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
}

/// 作为主要的state类继承于State
abstract class DuState<T extends DuStatefulWidget> extends State<T>
    with DuScaffoldMethod {
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

  void showSnackBar({SnackBar snackBar, Widget content, String text}) {
    widget.showSnackBar(snackBar: snackBar, content: content, text: text);
  }

  /// build child
  Widget buildChild(BuildContext context);
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

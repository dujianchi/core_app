library duscroll;

import 'package:flutter/material.dart';
import 'package:core_app/refresh/du_listeners.dart';

/// 带刷新和下拉的scrollview
class DuScrollView extends StatelessWidget {
  final Widget child;
  final RefreshCallback onRefresh;
  final OnLoadmore onLoadmore;
  final ScrollController _controller = ScrollController();
  final loadmoreEnable;
  final refreshEnable;
  // scrollview的属性
  final Axis scrollDirection;
  final bool reverse;
  final bool primary;
  final EdgeInsetsGeometry padding;

  DuScrollView({
    this.child,
    this.onRefresh,
    this.onLoadmore,
    this.loadmoreEnable = true,
    this.refreshEnable = true,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.primary,
    this.padding,
  });

  bool _onNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      if (_controller.position.maxScrollExtent > 0 &&
          _controller.position.maxScrollExtent == _controller.offset) {
        onLoadmore();
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = SingleChildScrollView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      primary: primary,
      padding: padding,
      physics: const AlwaysScrollableScrollPhysics(),
      controller: _controller,
      child: child,
    );
    if (onRefresh != null && refreshEnable) {
      widget = RefreshIndicator(
        child: widget,
        onRefresh: onRefresh,
      );
    }
    if (onLoadmore != null && loadmoreEnable) {
      widget = NotificationListener(
        child: widget,
        onNotification: _onNotification,
      );
    }
    return widget;
  }
}

library dugrid;

import 'package:flutter/material.dart';
import 'package:core_app/refresh/du_listeners.dart';

/// 带刷新和下拉的gridview
class DuGridView extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final List<Widget> children;
  final RefreshCallback onRefresh;
  final OnLoadmore onLoadmore;
  final ScrollController _controller = ScrollController();
  final loadmoreEnable;
  final refreshEnable;
  final Widget emptyView;
  // gridview的属性
  final Axis scrollDirection;
  final bool reverse;
  final bool primary;
  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final SliverGridDelegate gridDelegate;

  DuGridView({
    this.children,
    this.itemCount,
    this.itemBuilder,
    this.onRefresh,
    this.onLoadmore,
    this.loadmoreEnable = true,
    this.refreshEnable = true,
    this.emptyView,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.primary,
    this.shrinkWrap = false,
    this.padding,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    @required this.gridDelegate,
  }) {
    assert(children != null || (itemCount != null && itemBuilder != null));
    assert(gridDelegate != null);
  }

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
    Widget child;
    if (children != null) {
      child = GridView(
        scrollDirection: scrollDirection,
        reverse: reverse,
        primary: primary,
        shrinkWrap: shrinkWrap,
        padding: padding,
        addAutomaticKeepAlives: addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries,
        gridDelegate: gridDelegate,
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _controller,
        children: children,
      );
    } else if (itemCount != null && itemCount > 0 || emptyView == null) {
      child = GridView.builder(
        scrollDirection: scrollDirection,
        reverse: reverse,
        primary: primary,
        shrinkWrap: shrinkWrap,
        padding: padding,
        addAutomaticKeepAlives: addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries,
        gridDelegate: gridDelegate,
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _controller,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      );
    } else {
      child = SingleChildScrollView(child: emptyView);
    }
    if (onRefresh != null && refreshEnable) {
      child = RefreshIndicator(
        child: child,
        onRefresh: onRefresh,
      );
    }
    if (onLoadmore != null && loadmoreEnable) {
      child = NotificationListener(
        child: child,
        onNotification: _onNotification,
      );
    }
    return child;
  }
}

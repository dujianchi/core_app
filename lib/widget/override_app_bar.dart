import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

// copy from flutter 1.10.7 beta, at 2019.10.31, by dujc

class _ToolbarContainerLayout extends SingleChildLayoutDelegate {
  /// 自定义高度，会覆盖默认高度
  final double overrideHeight;

  _ToolbarContainerLayout(this.overrideHeight);

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(height: (overrideHeight ?? kToolbarHeight));
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, (overrideHeight ?? kToolbarHeight));
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height);
  }

  @override
  bool shouldRelayout(_ToolbarContainerLayout oldDelegate) => false;
}

class OverrideAppBar extends StatefulWidget implements PreferredSizeWidget {
  OverrideAppBar({
    Key key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.shape,
    this.backgroundColor,
    this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.overrideHeight,
  })  : assert(automaticallyImplyLeading != null),
        assert(elevation == null || elevation >= 0.0),
        assert(primary != null),
        assert(titleSpacing != null),
        assert(toolbarOpacity != null),
        assert(bottomOpacity != null),
        preferredSize = Size.fromHeight((overrideHeight ?? kToolbarHeight) +
            (bottom?.preferredSize?.height ?? 0.0)),
        super(key: key);

  final Widget leading;

  final bool automaticallyImplyLeading;

  final Widget title;

  final List<Widget> actions;

  final Widget flexibleSpace;

  final PreferredSizeWidget bottom;

  final double elevation;

  final ShapeBorder shape;

  final Color backgroundColor;

  final Brightness brightness;

  final IconThemeData iconTheme;

  final IconThemeData actionsIconTheme;

  final TextTheme textTheme;

  final bool primary;

  final bool centerTitle;

  final double titleSpacing;

  final double toolbarOpacity;

  final double bottomOpacity;

  /// 自定义高度，会覆盖默认高度
  final double overrideHeight;

  @override
  final Size preferredSize;

  bool _getEffectiveCenterTitle(ThemeData theme) {
    if (centerTitle != null) return centerTitle;
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return false;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return actions == null || actions.length < 2;
    }
    return null;
  }

  @override
  _OverrideAppBarState createState() => _OverrideAppBarState();
}

class _OverrideAppBarState extends State<OverrideAppBar> {
  static const double _defaultElevation = 4.0;

  void _handleDrawerButton() {
    Scaffold.of(context).openDrawer();
  }

  void _handleDrawerButtonEnd() {
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    assert(!widget.primary || debugCheckHasMediaQuery(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData theme = Theme.of(context);
    final AppBarTheme appBarTheme = AppBarTheme.of(context);
    final ScaffoldState scaffold = Scaffold.of(context, nullOk: true);
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);

    final bool hasDrawer = scaffold?.hasDrawer ?? false;
    final bool hasEndDrawer = scaffold?.hasEndDrawer ?? false;
    final bool canPop = parentRoute?.canPop ?? false;
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    IconThemeData overallIconTheme =
        widget.iconTheme ?? appBarTheme.iconTheme ?? theme.primaryIconTheme;
    IconThemeData actionsIconTheme = widget.actionsIconTheme ??
        appBarTheme.actionsIconTheme ??
        overallIconTheme;
    TextStyle centerStyle = widget.textTheme?.title ??
        appBarTheme.textTheme?.title ??
        theme.primaryTextTheme.title;
    TextStyle sideStyle = widget.textTheme?.body1 ??
        appBarTheme.textTheme?.body1 ??
        theme.primaryTextTheme.body1;

    if (widget.toolbarOpacity != 1.0) {
      final double opacity =
          const Interval(0.25, 1.0, curve: Curves.fastOutSlowIn)
              .transform(widget.toolbarOpacity);
      if (centerStyle?.color != null)
        centerStyle =
            centerStyle.copyWith(color: centerStyle.color.withOpacity(opacity));
      if (sideStyle?.color != null)
        sideStyle =
            sideStyle.copyWith(color: sideStyle.color.withOpacity(opacity));
      overallIconTheme = overallIconTheme.copyWith(
          opacity: opacity * (overallIconTheme.opacity ?? 1.0));
      actionsIconTheme = actionsIconTheme.copyWith(
          opacity: opacity * (actionsIconTheme.opacity ?? 1.0));
    }

    Widget leading = widget.leading;
    if (leading == null && widget.automaticallyImplyLeading) {
      if (hasDrawer) {
        leading = IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _handleDrawerButton,
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      } else {
        if (canPop)
          leading = useCloseButton ? const CloseButton() : const BackButton();
      }
    }
    if (leading != null) {
      leading = ConstrainedBox(
        constraints: BoxConstraints.tightFor(
            width: (widget.overrideHeight ?? kToolbarHeight)),
        child: leading,
      );
    }

    Widget title = widget.title;
    if (title != null) {
      bool namesRoute;
      switch (theme.platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          namesRoute = true;
          break;
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          break;
      }
      title = DefaultTextStyle(
        style: centerStyle,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        child: Semantics(
          namesRoute: namesRoute,
          child: title,
          header: true,
        ),
      );
    }

    Widget actions;
    if (widget.actions != null && widget.actions.isNotEmpty) {
      actions = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.actions,
      );
    } else if (hasEndDrawer) {
      actions = IconButton(
        icon: const Icon(Icons.menu),
        onPressed: _handleDrawerButtonEnd,
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    }

    if (actions != null) {
      actions = IconTheme.merge(
        data: actionsIconTheme,
        child: actions,
      );
    }

    final Widget toolbar = NavigationToolbar(
      leading: leading,
      middle: title,
      trailing: actions,
      centerMiddle: widget._getEffectiveCenterTitle(theme),
      middleSpacing: widget.titleSpacing,
    );

    Widget appBar = ClipRect(
      child: CustomSingleChildLayout(
        delegate: _ToolbarContainerLayout(widget.overrideHeight),
        child: IconTheme.merge(
          data: overallIconTheme,
          child: DefaultTextStyle(
            style: sideStyle,
            child: toolbar,
          ),
        ),
      ),
    );
    if (widget.bottom != null) {
      appBar = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: (widget.overrideHeight ?? kToolbarHeight)),
              child: appBar,
            ),
          ),
          widget.bottomOpacity == 1.0 //我在这改了个三目运算符，原来dart2.2也支持if-else的三目运算符
              ? widget.bottom
              : Opacity(
                  opacity:
                      const Interval(0.25, 1.0, curve: Curves.fastOutSlowIn)
                          .transform(widget.bottomOpacity),
                  child: widget.bottom,
                ),
        ],
      );
    }

    if (widget.primary) {
      appBar = SafeArea(
        top: true,
        child: appBar,
      );
    }

    appBar = Align(
      alignment: Alignment.topCenter,
      child: appBar,
    );

    if (widget.flexibleSpace != null) {
      appBar = Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          widget.flexibleSpace,
          appBar,
        ],
      );
    }
    final Brightness brightness = widget.brightness ??
        appBarTheme.brightness ??
        theme.primaryColorBrightness;
    final SystemUiOverlayStyle overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Material(
          color:
              widget.backgroundColor ?? appBarTheme.color ?? theme.primaryColor,
          elevation:
              widget.elevation ?? appBarTheme.elevation ?? _defaultElevation,
          shape: widget.shape,
          child: Semantics(
            explicitChildNodes: true,
            child: widget.overrideHeight == null
                ? appBar
                : SizedBox(
                    child: appBar,
                    height: widget.overrideHeight +
                        (widget.bottom?.preferredSize?.height ?? 0.0),
                  ),
          ),
        ),
      ),
    );
  }
}

class _FloatingAppBar extends StatefulWidget {
  const _FloatingAppBar({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _FloatingAppBarState createState() => _FloatingAppBarState();
}

class _FloatingAppBarState extends State<_FloatingAppBar> {
  ScrollPosition _position;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_position != null)
      _position.isScrollingNotifier.removeListener(_isScrollingListener);
    _position = Scrollable.of(context)?.position;
    if (_position != null)
      _position.isScrollingNotifier.addListener(_isScrollingListener);
  }

  @override
  void dispose() {
    if (_position != null)
      _position.isScrollingNotifier.removeListener(_isScrollingListener);
    super.dispose();
  }

  RenderSliverFloatingPersistentHeader _headerRenderer() {
    return context.findAncestorRenderObjectOfType<RenderSliverFloatingPersistentHeader>();
  }

  void _isScrollingListener() {
    if (_position == null) return;

    final RenderSliverFloatingPersistentHeader header = _headerRenderer();
    if (_position.isScrollingNotifier.value)
      header?.maybeStopSnapAnimation(_position.userScrollDirection);
    else
      header?.maybeStartSnapAnimation(_position.userScrollDirection);
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.leading,
    @required this.automaticallyImplyLeading,
    @required this.title,
    @required this.actions,
    @required this.flexibleSpace,
    @required this.bottom,
    @required this.elevation,
    @required this.forceElevated,
    @required this.backgroundColor,
    @required this.brightness,
    @required this.iconTheme,
    @required this.actionsIconTheme,
    @required this.textTheme,
    @required this.primary,
    @required this.centerTitle,
    @required this.titleSpacing,
    @required this.expandedHeight,
    @required this.collapsedHeight,
    @required this.topPadding,
    @required this.floating,
    @required this.pinned,
    @required this.snapConfiguration,
    @required this.shape,
    @required this.overrideHeight,
  })  : assert(primary || topPadding == 0.0),
        _bottomHeight = bottom?.preferredSize?.height ?? 0.0;

  final Widget leading;
  final bool automaticallyImplyLeading;
  final Widget title;
  final List<Widget> actions;
  final Widget flexibleSpace;
  final PreferredSizeWidget bottom;
  final double elevation;
  final bool forceElevated;
  final Color backgroundColor;
  final Brightness brightness;
  final IconThemeData iconTheme;
  final IconThemeData actionsIconTheme;
  final TextTheme textTheme;
  final bool primary;
  final bool centerTitle;
  final double titleSpacing;
  final double expandedHeight;
  final double collapsedHeight;
  final double topPadding;
  final bool floating;
  final bool pinned;
  final ShapeBorder shape;

  /// 自定义高度，会覆盖默认高度
  final double overrideHeight;

  final double _bottomHeight;

  @override
  double get minExtent =>
      collapsedHeight ??
      (topPadding + (overrideHeight ?? kToolbarHeight) + _bottomHeight);

  @override
  double get maxExtent => math.max(
      topPadding +
          (expandedHeight ??
              (overrideHeight ?? kToolbarHeight) + _bottomHeight),
      minExtent);

  @override
  final FloatingHeaderSnapConfiguration snapConfiguration;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double visibleMainHeight = maxExtent - shrinkOffset - topPadding;

    final double toolbarOpacity = !pinned || (floating && bottom != null)
        ? ((visibleMainHeight - _bottomHeight) /
                (overrideHeight ?? kToolbarHeight))
            .clamp(0.0, 1.0)
        : 1.0;

    final Widget appBar = FlexibleSpaceBar.createSettings(
      minExtent: minExtent,
      maxExtent: maxExtent,
      currentExtent: math.max(minExtent, maxExtent - shrinkOffset),
      toolbarOpacity: toolbarOpacity,
      child: OverrideAppBar(
        leading: leading,
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: title,
        actions: actions,
        flexibleSpace: (title == null && flexibleSpace != null)
            ? Semantics(child: flexibleSpace, header: true)
            : flexibleSpace,
        bottom: bottom,
        elevation: forceElevated ||
                overlapsContent ||
                (pinned && shrinkOffset > maxExtent - minExtent)
            ? elevation ?? 4.0
            : 0.0,
        backgroundColor: backgroundColor,
        brightness: brightness,
        iconTheme: iconTheme,
        actionsIconTheme: actionsIconTheme,
        textTheme: textTheme,
        primary: primary,
        centerTitle: centerTitle,
        titleSpacing: titleSpacing,
        shape: shape,
        toolbarOpacity: toolbarOpacity,
        bottomOpacity:
            pinned ? 1.0 : (visibleMainHeight / _bottomHeight).clamp(0.0, 1.0),
      ),
    );
    return floating ? _FloatingAppBar(child: appBar) : appBar;
  }

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return leading != oldDelegate.leading ||
        automaticallyImplyLeading != oldDelegate.automaticallyImplyLeading ||
        title != oldDelegate.title ||
        actions != oldDelegate.actions ||
        flexibleSpace != oldDelegate.flexibleSpace ||
        bottom != oldDelegate.bottom ||
        _bottomHeight != oldDelegate._bottomHeight ||
        elevation != oldDelegate.elevation ||
        backgroundColor != oldDelegate.backgroundColor ||
        brightness != oldDelegate.brightness ||
        iconTheme != oldDelegate.iconTheme ||
        actionsIconTheme != oldDelegate.actionsIconTheme ||
        textTheme != oldDelegate.textTheme ||
        primary != oldDelegate.primary ||
        centerTitle != oldDelegate.centerTitle ||
        titleSpacing != oldDelegate.titleSpacing ||
        expandedHeight != oldDelegate.expandedHeight ||
        topPadding != oldDelegate.topPadding ||
        pinned != oldDelegate.pinned ||
        floating != oldDelegate.floating ||
        snapConfiguration != oldDelegate.snapConfiguration;
  }

  @override
  String toString() {
    return '${describeIdentity(this)}(topPadding: ${topPadding.toStringAsFixed(1)}, bottomHeight: ${_bottomHeight.toStringAsFixed(1)}, ...)';
  }
}

class OverrideSliverAppBar extends StatefulWidget {
  const OverrideSliverAppBar({
    Key key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.forceElevated = false,
    this.backgroundColor,
    this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.expandedHeight,
    this.floating = false,
    this.pinned = false,
    this.snap = false,
    this.shape,
    this.overrideHeight,
  })  : assert(automaticallyImplyLeading != null),
        assert(forceElevated != null),
        assert(primary != null),
        assert(titleSpacing != null),
        assert(floating != null),
        assert(pinned != null),
        assert(snap != null),
        assert(floating || !snap,
            'The "snap" argument only makes sense for floating app bars.'),
        super(key: key);

  final Widget leading;

  final bool automaticallyImplyLeading;

  final Widget title;

  final List<Widget> actions;

  final Widget flexibleSpace;

  final PreferredSizeWidget bottom;

  final double elevation;

  final bool forceElevated;

  final Color backgroundColor;

  final Brightness brightness;

  final IconThemeData iconTheme;

  final IconThemeData actionsIconTheme;

  final TextTheme textTheme;

  final bool primary;

  final bool centerTitle;

  final double titleSpacing;

  final double expandedHeight;

  final bool floating;

  final bool pinned;

  final ShapeBorder shape;

  /// 自定义高度，会覆盖默认高度
  final double overrideHeight;

  final bool snap;

  @override
  _OverrideSliverAppBarState createState() => _OverrideSliverAppBarState();
}

class _OverrideSliverAppBarState extends State<OverrideSliverAppBar>
    with TickerProviderStateMixin {
  FloatingHeaderSnapConfiguration _snapConfiguration;

  void _updateSnapConfiguration() {
    if (widget.snap && widget.floating) {
      _snapConfiguration = FloatingHeaderSnapConfiguration(
        vsync: this,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 200),
      );
    } else {
      _snapConfiguration = null;
    }
  }

  @override
  void initState() {
    super.initState();
    _updateSnapConfiguration();
  }

  @override
  void didUpdateWidget(OverrideSliverAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.snap != oldWidget.snap || widget.floating != oldWidget.floating)
      _updateSnapConfiguration();
  }

  @override
  Widget build(BuildContext context) {
    assert(!widget.primary || debugCheckHasMediaQuery(context));
    final double topPadding =
        widget.primary ? MediaQuery.of(context).padding.top : 0.0;
    final double collapsedHeight =
        (widget.pinned && widget.floating && widget.bottom != null)
            ? widget.bottom.preferredSize.height + topPadding
            : null;

    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: SliverPersistentHeader(
        floating: widget.floating,
        pinned: widget.pinned,
        delegate: _SliverAppBarDelegate(
            leading: widget.leading,
            automaticallyImplyLeading: widget.automaticallyImplyLeading,
            title: widget.title,
            actions: widget.actions,
            flexibleSpace: widget.flexibleSpace,
            bottom: widget.bottom,
            elevation: widget.elevation,
            forceElevated: widget.forceElevated,
            backgroundColor: widget.backgroundColor,
            brightness: widget.brightness,
            iconTheme: widget.iconTheme,
            actionsIconTheme: widget.actionsIconTheme,
            textTheme: widget.textTheme,
            primary: widget.primary,
            centerTitle: widget.centerTitle,
            titleSpacing: widget.titleSpacing,
            expandedHeight: widget.expandedHeight,
            collapsedHeight: collapsedHeight,
            topPadding: topPadding,
            floating: widget.floating,
            pinned: widget.pinned,
            shape: widget.shape,
            snapConfiguration: _snapConfiguration,
            overrideHeight: widget.overrideHeight),
      ),
    );
  }
}

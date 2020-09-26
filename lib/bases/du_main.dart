import 'package:core_app/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DuMain extends BaseMaterialApp {
  final double designWidth;
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
    this.designWidth = Dimens.default_design_width,
    //scallford
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
    // material app
    Key key,
    navigatorKey,
    routes: const <String, WidgetBuilder>{},
    initialRoute,
    onGenerateRoute,
    onUnknownRoute,
    builder,
    title: '',
    onGenerateTitle,
    color,
    theme,
    locale,
    localizationsDelegates: BaseMaterialApp.duLocalizationsDelegates,
    localeListResolutionCallback,
    localeResolutionCallback,
    supportedLocales: Texts.support_locales,
    debugShowMaterialGrid: false,
    showPerformanceOverlay: false,
    checkerboardRasterCacheImages: false,
    checkerboardOffscreenLayers: false,
    showSemanticsDebugger: false,
    debugShowCheckedModeBanner: true,
    // mine
    initDimens: true,
  }) : super(
          key: key,
          navigatorKey: navigatorKey,
          home: Builder(
            builder: (context) => _buildHome(
              initDimens: initDimens,
              context: context,
              designWidth: designWidth,
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
          ),
          routes: routes,
          initialRoute: initialRoute,
          onGenerateRoute: onGenerateRoute,
          onUnknownRoute: onUnknownRoute,
          navigatorObservers: [App.instance],
          builder: builder,
          title: title,
          onGenerateTitle: onGenerateTitle,
          color: color,
          theme: theme,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales,
          debugShowMaterialGrid: debugShowMaterialGrid,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        );

  static Widget _buildHome({
    bool initDimens,
    BuildContext context,
    double designWidth,
    PreferredSizeWidget appBar,
    Widget body,
    Widget floatingActionButton,
    FloatingActionButtonLocation floatingActionButtonLocation,
    FloatingActionButtonAnimator floatingActionButtonAnimator,
    List<Widget> persistentFooterButtons,
    Widget drawer,
    Widget endDrawer,
    Widget bottomNavigationBar,
    Widget bottomSheet,
    Color backgroundColor,
    bool resizeToAvoidBottomPadding,
    bool resizeToAvoidBottomInset,
    bool primary,
    DragStartBehavior drawerDragStartBehavior,
    bool extendBody,
    bool extendBodyBehindAppBar,
    Color drawerScrimColor,
    double drawerEdgeDragWidth,
  }) {
    if (initDimens == true) Dimens.init(context, designWidth);
    return Scaffold(
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
    );
  }
}

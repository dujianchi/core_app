import 'package:core_app/core.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

class WebCompat extends DuPage {
  final Widget webView;
  final String src;
  final IFrameElement _iframeElement = IFrameElement();

  WebCompat({this.webView, this.src}) {
    assert(webView != null && src != null);
  }

  IFrameElement get iFrameElement => _iframeElement;

  @override
  Widget buildChild(BuildContext context) => kIsWeb
      ? Builder(builder: (context) {
          // _iframeElement.height = '500';
          // _iframeElement.width = '500';
          _iframeElement.src = src;
          _iframeElement.style.border = 'none';

          // ignore: undefined_prefixed_name
          ui.platformViewRegistry.registerViewFactory(
            'iframeElement',
            (int viewId) => _iframeElement,
          );
          Widget _iframeWidget = HtmlElementView(
            key: UniqueKey(),
            viewType: 'iframeElement',
          );
          return _iframeWidget;
        })
      : webView;
}

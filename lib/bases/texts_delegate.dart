import 'dart:async';

import 'texts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';


/// support 'zh-CN' and 'en-US'
class TextsDelegate extends LocalizationsDelegate<Texts> {
  const TextsDelegate._internal();

  static const TextsDelegate delegate = const TextsDelegate._internal();

  factory TextsDelegate() => delegate;

  @override
  bool isSupported(Locale locale) =>
      Texts.support_language.contains(locale.languageCode);

  @override
  Future<Texts> load(Locale locale) {
    return SynchronousFuture<Texts>(Texts().initLanguageLocale(locale));
  }

  @override
  bool shouldReload(TextsDelegate old) => (old != delegate);
}

import 'package:flutter/widgets.dart';

/// init and setup 'en' and 'zh'
class Texts {
  static const support_language = const <String>['en', 'zh'];
  static const support_locales = const <Locale>[const Locale('en'), const Locale('zh')];

  Texts._internal();

  static final Texts _instance = Texts._internal();

  factory Texts() => _instance;

  String languageCode = support_language[0];

  Texts initLanguageContext(BuildContext context) {
    if (context != null)
      languageCode =
          Localizations.localeOf(context, nullOk: true)?.languageCode;
    if (languageCode == null) languageCode = support_language[0];
    return this;
  }

  Texts initLanguageString(String languageCode) {
    if (languageCode != null && languageCode.isNotEmpty)
      this.languageCode = languageCode;
    return this;
  }

  Texts initLanguageLocale(Locale locale) {
    return initLanguageString(locale?.languageCode);
  }

  String getWithContext(BuildContext context,
      Map<String, Map<String, String>> strings, String key) {
    initLanguageContext(context);
    return getString(strings, key);
  }

  String getString(Map<String, Map<String, String>> strings, String key) {
    var texts = strings[languageCode];
    if (texts == null || texts.length == 0) //若是取不到这个map，或者取到了map但值为空，则取默认的map
      texts = strings[support_language[0]];

    return (texts == null || texts[key] == null)
        ? '$key' //'$key is not exists'
        : texts[key]; //若是取到了map，但没取到对应的key，将返回key
  }
}

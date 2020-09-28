import 'package:flutter/widgets.dart';

/// init and setup 'en' and 'zh'
class Texts {
  static const support_language = const <String>['en', 'zh'];
  static const support_locales = const <Locale>[
    const Locale('en'),
    const Locale('zh')
  ];

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

  String getWithContexts(BuildContext context,
      Map<String, Map<String, String>> strings, List<String> args,
      [String split = '']) {
    initLanguageContext(context);
    return getStrings(strings, args, split);
  }

  String getStrings(Map<String, Map<String, String>> strings, List<String> args,
      [String split = '']) {
    var texts = strings[languageCode];
    if (texts == null || texts.length == 0) //若是取不到这个map，或者取到了map但值为空，则取默认的map
      texts = strings[support_language[0]];
    String result;
    args?.forEach((str) {
      var newStr =
          '${(texts == null || texts[str] == null) ? '$str' : texts[str]}';
      result = result?.isNotEmpty == true ? '$result$split$newStr' : newStr;
    });
    return result;
  }
}

class I18n {
  String getContextString(BuildContext context, String key) =>
      Texts().getWithContext(context, stringMaps(), key);

  String getString(String key) => Texts().getString(stringMaps(), key);

  String getContextStrings(BuildContext context, List<String> args,
          [String split = '']) =>
      Texts().getWithContexts(context, stringMaps(), args, split);

  String getStrings(List<String> args, [String split = '']) =>
      Texts().getStrings(stringMaps(), args, split);

  /// 当前页面中需要用到的字符串，默认支持'zh'和'en'
  Map<String, Map<String, String>> stringMaps() => const {};
}

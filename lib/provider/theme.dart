import 'package:enfly/theme/color.dart';
import 'package:enfly/theme/ui_theme.dart';
import 'package:enfly/utils/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultThemeData with ChangeNotifier {
  ThemeType _currentThemeType = ThemeType.brisk;
  //final CoreServicesImpl _coreInstance = TIMUIKitCore.getInstance();
  UITheme _theme = CommonColor.defaultTheme;

  UITheme get theme {
    return _theme;
  }

  set theme(UITheme theme) {
    _theme = theme;
    notifyListeners();
  }

  ThemeType get currentThemeType => _currentThemeType;

  set currentThemeType(ThemeType type) {
    _currentThemeType = type;
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((prefs) {
      prefs.setString("themeType", type.toString());
    });
    //_coreInstance.setTheme(theme: DefTheme.defaultTheme[type]!);
    theme = DefTheme.defaultTheme[type]!;
    notifyListeners();
  }
}

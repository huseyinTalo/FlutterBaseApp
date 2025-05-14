import 'package:flutter/foundation.dart';
import '../models/theme_model.dart';

class ThemeViewModel extends ChangeNotifier {
  ThemeModel _model = ThemeModel();
  
  bool get isDarkMode => _model.isDarkMode;
  
  void toggleTheme() {
    _model = _model.copyWith(isDarkMode: !_model.isDarkMode);
    notifyListeners();
  }
}
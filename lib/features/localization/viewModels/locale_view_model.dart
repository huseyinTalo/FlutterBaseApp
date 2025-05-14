// viewmodels/locale_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LocaleViewModel extends ChangeNotifier {
  Locale _currentLocale;
  
  LocaleViewModel({Locale? initialLocale}) 
    : _currentLocale = initialLocale ?? const Locale('en');
  
  Locale get currentLocale => _currentLocale;
  
  void setLocale(BuildContext context, Locale locale) async {
    if (_currentLocale == locale) return;
    
    _currentLocale = locale;
    await context.setLocale(locale);
    notifyListeners();
  }
  
  void toggleLocale(BuildContext context) {
    final newLocale = _currentLocale.languageCode == 'en' 
        ? const Locale('tr') 
        : const Locale('en');
    
    setLocale(context, newLocale);
  }
  
  String get languageName {
    return _currentLocale.languageCode == 'en' ? 'English' : 'Türkçe';
  }
  
  bool isCurrentLocale(String localeCode) {
    return _currentLocale.languageCode == localeCode;
  }
}
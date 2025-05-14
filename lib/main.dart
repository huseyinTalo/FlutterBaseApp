// main.dart
import 'package:drverapp/features/demo/viewModels/counter_view_model.dart';
import 'package:drverapp/features/demo/viewModels/theme_view_model.dart';
import 'package:drverapp/features/demo/views/home_page_view.dart';
import 'package:drverapp/features/localization/viewModels/locale_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: const [Locale('en'), Locale('tr')],
      path: 'lib/assets/translations',
      fallbackLocale: const Locale('en'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CounterViewModel()),
          ChangeNotifierProvider(create: (_) => ThemeViewModel()),
          ChangeNotifierProvider(
            create: (_) => LocaleViewModel(
              initialLocale: const Locale('en')
            )
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'app_title'.tr(),
      theme: themeViewModel.isDarkMode
          ? ThemeData.dark()
          : ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
      home: const HomePage(title: 'app_title'),
    );
  }
}
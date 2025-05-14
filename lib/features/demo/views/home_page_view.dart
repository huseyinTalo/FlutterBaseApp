// views/home_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../viewModels/counter_view_model.dart';
import '../viewModels/theme_view_model.dart';
import '../../localization/viewModels/locale_view_model.dart';
import 'drawer_menu_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final counterViewModel = Provider.of<CounterViewModel>(context);
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    final localeViewModel = Provider.of<LocaleViewModel>(context);
    
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerMenu(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title.tr()),
        actions: [
          // Dil seçim butonu
          IconButton(
            icon: const Icon(Icons.language),
            tooltip: localeViewModel.languageName,
            onPressed: () => localeViewModel.toggleLocale(context),
          ),
          // Tema değiştirme butonu
          IconButton(
            icon: Icon(themeViewModel.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => themeViewModel.toggleTheme(),
          ),
          // PNG ikon drawer açmak için
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              child: Image.asset(
                'lib/assets/icons/profile_icon.png',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Seçilen: ${_selectedIndex == 0 ? 'home'.tr() : _selectedIndex == 1 ? 'settings'.tr() : 'about'.tr()}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text('counter_text'.tr()),
            Text(
              '${counterViewModel.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterViewModel.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
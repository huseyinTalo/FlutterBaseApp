// views/drawer_menu.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../viewModels/theme_view_model.dart';
import '../../localization/viewModels/locale_view_model.dart';

class DrawerMenu extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const DrawerMenu({
    super.key, 
    required this.selectedIndex, 
    required this.onItemTapped
  });

  @override
  Widget build(BuildContext context) {
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    final localeViewModel = Provider.of<LocaleViewModel>(context);
    
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white70,
                  child: Text(
                    'A',
                    style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'app_title'.tr(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'email'.tr(),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          _buildMenuItem(context, 0, Icons.home, 'home'.tr()),
          _buildMenuItem(context, 1, Icons.settings, 'settings'.tr()),
          _buildMenuItem(context, 2, Icons.info, 'about'.tr()),
          const Divider(),
          ListTile(
            leading: Icon(themeViewModel.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            title: Text(themeViewModel.isDarkMode ? 'light_theme'.tr() : 'dark_theme'.tr()),
            onTap: () {
              themeViewModel.toggleTheme();
              Navigator.pop(context);
            },
          ),
          // Dil değiştirme seçeneği
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(localeViewModel.languageName),
            onTap: () {
              localeViewModel.toggleLocale(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
  
  Widget _buildMenuItem(BuildContext context, int index, IconData icon, String title) {
    return ListTile(
      selected: selectedIndex == index,
      selectedTileColor: Colors.grey.withOpacity(0.2),
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        onItemTapped(index);
        Navigator.pop(context);
      },
    );
  }
}
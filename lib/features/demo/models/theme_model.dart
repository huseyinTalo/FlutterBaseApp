class ThemeModel {
  final bool isDarkMode;
  
  ThemeModel({this.isDarkMode = false});
  
  ThemeModel copyWith({bool? isDarkMode}) {
    return ThemeModel(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
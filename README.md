# DrVerApp

![Flutter Version](https://img.shields.io/badge/Flutter-3.7.2+-blue.svg)
![Dart Version](https://img.shields.io/badge/Dart-3.0.0+-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

DrVerApp is a modern Flutter application showcasing best practices for state management, localization, and architecture implementation. This project demonstrates the MVVM (Model-View-ViewModel) architecture pattern using Provider for state management.

<p align="center">
  <img src="screenshots/app_screenshot.png" alt="App Screenshot" width="300"/>
  <!-- Replace with your actual screenshot -->
</p>

## ✨ Features

- **MVVM Architecture**: Clean separation of concerns
- **Provider State Management**: Using MultiProvider for efficient state handling
- **Multilingual Support**: Easy switching between English and Turkish
- **Theme Switching**: Dynamic light and dark theme toggle
- **Custom Navigation Drawer**: Accessible via custom icon
- **Responsive Design**: Adaptable UI for various screen sizes

## 🛠️ Technologies & Packages

- Flutter SDK ^3.7.2
- Provider ^6.1.5
- Easy Localization ^3.0.3
- Cupertino Icons ^1.0.8

## 📦 Getting Started

### Prerequisites

- Flutter SDK (^3.7.2)
- Dart SDK (^3.0.0)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**

```bash
git clone https://github.com/yourusername/drverapp.git
cd drverapp
```

2. **Install dependencies**

```bash
flutter pub get
```

3. **Run the app**

```bash
flutter run
```

## 🏗️ Project Structure

The project follows MVVM architecture with a structured folder organization:

```
lib/
  |- assets/
  |    |- icons/               # App icons
  |    |- translations/        # Localization files
  |
  |- features/
  |    |- demo/
  |        |- models/          # Data models
  |        |- viewModels/      # ViewModels (Counter, Theme, Locale)
  |        |- views/           # UI components
  |        |- localization/    # Localization support
  |
  |- main.dart                 # App entry point
```

## 💡 Usage Examples

### State Management with Provider

```dart
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => CounterViewModel()),
    ChangeNotifierProvider(create: (_) => ThemeViewModel()),
    ChangeNotifierProvider(create: (_) => LocaleViewModel()),
  ],
  child: const MyApp(),
)
```

### Localization Implementation

```dart
EasyLocalization(
  supportedLocales: const [Locale('en', 'US'), Locale('tr', 'TR')],
  path: 'lib/assets/translations',
  fallbackLocale: const Locale('en', 'US'),
  child: MultiProvider(...),
)
```

## 📸 Screenshots

<p align="center">
  <img src="screenshots/light_theme.png" alt="Light Theme" width="250"/>
  <img src="screenshots/dark_theme.png" alt="Dark Theme" width="250"/>
  <img src="screenshots/drawer_menu.png" alt="Drawer Menu" width="250"/>
</p>

<!-- Replace the placeholders with actual screenshots -->

## 🌐 Localization

The app supports the following languages:
- English
- Turkish

To add a new language:
1. Create a new JSON file in `lib/assets/translations/`
2. Add language support in the `LocaleViewModel`
3. Update the supported locales in `main.dart`

## 🔄 State Management

The app uses Provider for state management with separate ViewModels for:
- Counter functionality
- Theme preferences
- Localization settings

## 📱 Architecture Design

The project follows MVVM architecture:
- **Models**: Data structures and business logic
- **Views**: UI components and screens
- **ViewModels**: State managers that connect Models and Views

## 🧪 Testing

Run tests with:

```bash
flutter test
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Provider package for simplifying state management
- Easy Localization for streamlined language support

---

<p align="center">
  Made with ❤️ by [Your Name]
</p>

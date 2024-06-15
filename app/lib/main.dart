import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wtracker/i18n/strings.g.dart';
import 'package:wtracker/core/utils.dart';
import 'package:wtracker/presentation/pages/category.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  settingUpSystemUIOverlay();

  LocaleSettings.useDeviceLocale();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wtracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const CategoryListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

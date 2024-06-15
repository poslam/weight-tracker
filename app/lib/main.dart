import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/i18n/strings.g.dart';
import 'package:todo/core/utils.dart';
import 'package:todo/presentation/pages/category.dart';

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
      title: 'weight-tracker',
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

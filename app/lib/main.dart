import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/api/chopper.dart';
import 'core/provider/api.dart';
import 'core/provider/repository.dart';
import 'core/utils/ui.dart';
import 'features/ui/theme.dart';
import 'navigation/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUpSystemUIOverlay();

  runApp(
    ProviderScope(
      overrides: [
        ProviderApi.api.overrideWith(
          (ref) => Api(
            baseUrl: "https://weight.poslam.ru/api/v1/",
            tokenRepository: ref.watch(ProviderRepository.tokenRepository),
          ),
        ),
        ProviderApi.sessionApi.overrideWith(
          (_) => SessionApi(baseUrl: "https://weight.poslam.ru/api/v1/"),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'wtracker',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.light,
        ),
      ).copyWith(
        extensions: [
          AppTheme(
            background: Colors.white,
            line: Colors.black87,
            control: Colors.black,
            text: Colors.black,
          )
        ],
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ).copyWith(
        extensions: [
          AppTheme(
            background: Colors.deepPurple,
            line: Colors.white70,
            control: Colors.white,
            text: Colors.white,
          ),
        ],
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}

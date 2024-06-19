import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setUpSystemUIOverlay() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: false,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent));
      
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

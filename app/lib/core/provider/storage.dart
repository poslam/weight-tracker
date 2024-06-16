import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../storage/settings.dart';
import '../storage/token.dart';

final class ProviderStorage {
  static final token = Provider(
    (_) => TokenStorage(),
  );

  static final settings = Provider(
    (_) => SettingsStorage(),
  );
}

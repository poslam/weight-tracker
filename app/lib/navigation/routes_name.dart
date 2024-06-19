final class RoutesName {
  static const String login = '/login';
  static const String home = '/home';
}

bool needAuth(String fullPath) {
  if (fullPath.startsWith(RoutesName.home)) {
    return true;
  }

  return false;
}

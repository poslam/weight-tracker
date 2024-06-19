import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/provider/repository.dart';
import '../pages/home.dart';
import '../pages/login.dart';
import 'routes_name.dart';
import 'scaffold.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: RoutesName.home,
  routerNeglect: true,
  navigatorKey: rootNavigatorKey,
  redirect: (context, state) async {
    final tokenRepository = ProviderScope.containerOf(context)
        .read(ProviderRepository.tokenRepository);

    if (!needAuth(state.fullPath ?? "")) {
      return null;
    }

    await tokenRepository.refresh();

    if (!tokenRepository.haveValidToken()) {
      return RoutesName.login;
    }

    return null;
  },
  routes: [
    GoRoute(
      path: RoutesName.login,
      builder: (context, state) => const LoginPage(),
    ),
    ShellRoute(
      builder: (context, state, child) => NavigationScaffold(
        routeName: state.fullPath,
        child: child,
      ),
      routes: [
        GoRoute(
          path: RoutesName.home,
          name: RoutesName.home,
          builder: (context, state) => const HomePage(),
        ),
      ],
    ),
  ],
);

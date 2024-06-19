import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'router.dart';
import 'routes_name.dart';

final class AppNavigator {
  static final BuildContext _context = rootNavigatorKey.currentContext!;

  static void openLoginPage() => Router.neglect(
        _context,
        () => _context.go(RoutesName.login),
      );

  static void openHomePage() => Router.neglect(
        _context,
        () => _context.go(RoutesName.home),
      );
}

final class BottomSheetNavigator {
  // static final BuildContext _context = rootNavigatorKey.currentContext!;

  BottomSheetNavigator._();

  static void closeBottomSheet() {
    Navigator.of(rootNavigatorKey.currentContext!).pop();
  }

  // static void openOtaBottomSheet() {
  //   showModalBottomSheet(
  //     context: _context,
  //     backgroundColor: _context.ffTheme.color.mainBackgoundColor,
  //     builder: (context) => const Wrap(
  //       children: [
  //         OtaBottomSheet(),
  //       ],
  //     ),
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(16),
  //         topRight: Radius.circular(16),
  //       ),
  //     ),
  //     useSafeArea: true,
  //     isScrollControlled: true,
  //   );
  // }
}

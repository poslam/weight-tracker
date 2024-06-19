import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../../.gen/i18n/strings.g.dart';
import '../../navigation/router.dart';

final class CustomSnackBar {
  static BuildContext get _context => rootNavigatorKey.currentContext!;

  static void showSnackBar(
    String text, {
    String? shareData,
  }) {
    ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.horizontal,
        content: Text(text),
        behavior: SnackBarBehavior.floating,
        // margin: EdgeInsets.symmetric(
        //   vertical: 16 + MediaQuery.of(_context).padding.bottom,
        //   horizontal: 16,
        // ),
        action: shareData != null
            ? SnackBarAction(
                onPressed: () => Share.share(shareData),
                textColor: Theme.of(_context).colorScheme.surface,
                label: t.common.send,
              )
            : null,
      ),
    );
  }
}

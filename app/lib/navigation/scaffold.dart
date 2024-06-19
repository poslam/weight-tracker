import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationScaffold extends HookConsumerWidget {
  const NavigationScaffold(
      {super.key, required this.child, required this.routeName});

  final Widget child;
  final String? routeName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: child,
          ),
        ],
      ),
    );
  }
}

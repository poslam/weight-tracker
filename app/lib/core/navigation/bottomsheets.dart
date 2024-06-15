import 'package:flutter/material.dart';

void openBottomSheet(BuildContext context, Widget bottomSheetWidget) {
  showModalBottomSheet(
    context: context,
    builder: (context) => bottomSheetWidget,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    isScrollControlled: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 300),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final bool isLoading;
  final double evevation;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
    this.evevation = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.appTheme.paddingMedium),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Center(
            child: isLoading
                ? LoadingAnimationWidget.prograssiveDots(
                    color: Theme.of(context).colorScheme.secondary,
                    size: 50,
                  )
                : Text(text),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.isRequired = false,
    this.isObscure = false,
    this.canObscure = false,
    required this.controller,
    this.formatters,
    this.validator,
    this.insideHint,
    this.autofillHints,
    this.textInputAction,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0),
  });

  final EdgeInsets padding;
  final String hint;
  final String? insideHint;
  final bool isRequired;
  final bool isObscure;
  final bool canObscure;
  final TextEditingController controller;
  final List<TextInputFormatter>? formatters;
  final String? Function(String?)? validator;
  final List<String>? autofillHints;
  final TextInputAction? textInputAction;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isNowObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.appTheme.paddingSmall,
              horizontal: context.appTheme.paddingMedium,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.hint),
                SizedBox(width: context.appTheme.paddingSmall),
                if (widget.isRequired)
                  Text(
                    '*',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                  )
              ],
            ),
          ),
          TextFormField(
            controller: widget.controller,
            obscureText:
                widget.isObscure || (widget.canObscure && isNowObscure),
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: widget.formatters,
            autofillHints: widget.autofillHints,
            textInputAction: widget.textInputAction,
            decoration: InputDecoration(
              hintText: widget.insideHint,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: context.appTheme.paddingSmall * 2.5,
                horizontal: context.appTheme.paddingSmall * 2,
              ),
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(context.appTheme.borderRadiusMedium),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.appTheme.line),
                borderRadius:
                    BorderRadius.circular(context.appTheme.borderRadiusMedium),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: context.appTheme.control, width: 2),
                borderRadius:
                    BorderRadius.circular(context.appTheme.borderRadiusMedium),
              ),
              suffixIcon: widget.canObscure
                  ? Padding(
                      padding: EdgeInsets.all(context.appTheme.paddingSmall),
                      child: IconButton(
                        onPressed: obscureChanger,
                        icon: Icon(
                          isNowObscure
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 24,
                        ),
                      ),
                    )
                  : null,
            ),
          )
        ],
      ),
    );
  }

  void obscureChanger() {
    setState(() {
      isNowObscure = !isNowObscure;
    });
  }
}

import 'package:sudoku_mordern/src/config/colors.dart';
import 'package:sudoku_mordern/src/ui/common/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppPasswordField extends StatefulWidget {
  final String? label;
  final TextStyle? labelStyle;
  final String? titleText;
  final String? hint;
  final String? initialValue;
  final FocusNode? focusNode;
  final Function(String?)? onChanged;
  final ValueChanged<String?>? onSaved;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final BorderRadius? borderRadius;
  final bool? enabled;
  final InputDecoration? inputDecoration;
  final InputBorder? inputBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? enabledInputBorder;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final Color? fillColor;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final bool autoFocus;

  const AppPasswordField({
    super.key,
    this.titleText,
    this.initialValue,
    this.focusNode,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.hint,
    this.prefixIcon,
    this.borderRadius,
    this.enabled,
    this.inputDecoration,
    this.label,
    this.contentPadding,
    this.suffixIcon,
    this.autovalidateMode,
    this.keyboardType,
    this.inputBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.labelStyle,
    this.hintStyle,
    this.fillColor,
    this.controller,
    this.enabledInputBorder,
    this.inputTextStyle,
    this.inputFormatter,
    this.textInputAction,
    this.onFieldSubmitted,
    this.autoFocus = false,
  });

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool obscureText = true;

  void onPasswordVisibilityToggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.titleText != null) ...[
          Text(
            widget.titleText!,
            style: textTheme.bodyMedium?.copyWith(),
          ),
          const SizedBox(height: 8),
        ],
        AppTextField(
          maxLines: 1,
          validator: widget.validator,
          obscureText: obscureText,
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          initialValue: widget.initialValue,
          controller: widget.controller,
          textInputAction: widget.textInputAction,
          enabled: widget.enabled,
          keyboardType: widget.keyboardType,
          autovalidateMode:
              widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
          inputTextStyle: widget.inputTextStyle ?? textTheme.titleLarge,
          inputDecoration: widget.inputDecoration ??
              InputDecoration(
                counterText: "",
                filled: widget.fillColor != null,
                fillColor: widget.fillColor,
                label: widget.label != null
                    ? Text(
                        widget.label ?? "",
                      )
                    : null,
                labelStyle: widget.labelStyle ?? textTheme.bodyMedium,
                hintText: widget.hint,
                hintStyle: widget.hintStyle ?? textTheme.titleLarge,
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                enabledBorder: widget.enabledInputBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        width: 1,
                      ),
                    ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    width: 1,
                    // color: AppColor.textFieldBorderColor,
                  ),
                ),
                border: widget.inputBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        width: 1,
                        // color: AppColor.primary,
                      ),
                    ),
                focusedBorder: widget.focusedBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColors.primary,
                      ),
                    ),
                focusedErrorBorder: widget.focusedErrorBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColors.error,
                      ),
                    ),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon ??
                    GestureDetector(
                      onTap: onPasswordVisibilityToggle,
                      child: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
              ),
        ),
      ],
    );
  }
}

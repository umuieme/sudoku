import 'package:sudoku_mordern/src/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final TextStyle? labelStyle;
  final String? titleText;
  final String? hint;
  final String? initialValue;
  final FocusNode? focusNode;
  final Function(String?)? onChanged;
  final ValueChanged<String?>? onSaved;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final BorderRadius? borderRadius;
  final bool? enabled;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
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

  const AppTextField({
    super.key,
    this.titleText,
    this.initialValue,
    this.focusNode,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.obscureText = false,
    this.hint,
    this.prefixIcon,
    this.borderRadius,
    this.enabled,
    this.maxLines,
    this.maxLength,
    this.maxLengthEnforcement,
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
    this.minLines,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleText != null) ...[
          Text(
            titleText!,
            style: textTheme.bodyMedium?.copyWith(),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          autofocus: autoFocus,
          minLines: minLines,
          validator: validator,
          obscureText: obscureText,
          onSaved: onSaved,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          initialValue: initialValue,
          controller: controller,
          textInputAction: textInputAction,
          enabled: enabled,
          maxLines: maxLines ?? 1,
          maxLength: maxLength,
          maxLengthEnforcement: maxLengthEnforcement,
          keyboardType: keyboardType,
          autovalidateMode:
              autovalidateMode ?? AutovalidateMode.onUserInteraction,
          style: inputTextStyle ?? textTheme.titleLarge,
          decoration: inputDecoration ??
              InputDecoration(
                counterText: "",
                filled: true,
                fillColor: Colors.white70,
                label: label != null
                    ? Text(
                        label ?? "",
                      )
                    : null,
                labelStyle: labelStyle ?? textTheme.bodyMedium,
                hintText: hint,
                hintStyle: hintStyle ?? textTheme.titleLarge,
                contentPadding: contentPadding ??
                    const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                enabledBorder: enabledInputBorder ??
                    OutlineInputBorder(
                      borderRadius: borderRadius ?? BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColors.text,
                      ),
                    ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    width: 1,
                    // color: AppColor.textFieldBorderColor,
                  ),
                ),
                border: inputBorder ??
                    OutlineInputBorder(
                      borderRadius: borderRadius ?? BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        width: 1,
                        // color: AppColor.primary,
                      ),
                    ),
                focusedBorder: focusedBorder ??
                    OutlineInputBorder(
                      borderRadius: borderRadius ?? BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColors.primary,
                      ),
                    ),
                focusedErrorBorder: focusedErrorBorder ??
                    OutlineInputBorder(
                      borderRadius: borderRadius ?? BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColors.error,
                      ),
                    ),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
              ),
          inputFormatters: inputFormatter,
        ),
      ],
    );
  }
}

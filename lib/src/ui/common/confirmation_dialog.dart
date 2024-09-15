import 'package:sudoku_mordern/src/config/colors.dart';
import 'package:sudoku_mordern/src/config/extensions/context_extension.dart';
import 'package:sudoku_mordern/src/ui/common/primary_button.dart';
import 'package:sudoku_mordern/src/ui/common/secondary_button.dart';
import 'package:flutter/material.dart';

Future<bool> showConfirmationDialog(
    {required BuildContext context,
    required String title,
    required String desription}) async {
  final result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(desription),
          actions: [
            AppSecondaryButton(
              title: "Cancel",
              onPressed: () => context.pop(false),
            ),
            AppPrimaryButton(
              title: "Exit",
              color: AppColors.error,
              onPressed: () => context.pop(true),
            ),
          ],
        );
      });

  return result ?? false;
}

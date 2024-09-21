import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudoku_mordern/src/config/colors.dart';
import 'package:sudoku_mordern/src/config/extensions/context_extension.dart';
import 'package:sudoku_mordern/src/ui/common/primary_button.dart';
import 'package:sudoku_mordern/src/ui/common/secondary_button.dart';
import 'package:flutter/material.dart';

Future<bool> showConfirmationDialog(
    {required BuildContext context,
    required String title,
    required String desription,
    String? confirmActionTitle}) async {
  final result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          title: Text(title),
          content: Text(
            desription,
            style: context.textTheme.bodyLarge,
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: AppSecondaryButton(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    title: "Cancel",
                    onPressed: () => context.pop(false),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: AppPrimaryButton(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    title: confirmActionTitle ?? "Ok",
                    color: AppColors.error,
                    onPressed: () => context.pop(true),
                  ),
                ),
              ],
            ),
          ],
        );
      });

  return result ?? false;
}

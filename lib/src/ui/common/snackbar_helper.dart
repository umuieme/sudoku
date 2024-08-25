import 'package:sudoku_mordern/src/config/colors.dart';
import 'package:sudoku_mordern/src/config/enum.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  AppSnackBar._();

  static showSnackbar(
      {required BuildContext context,
      required String message,
      MessageType messageType = MessageType.normal}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            Icon(
              _setIconData(messageType),
              size: 20,
              color: _setTextColor(messageType),
            ),
            const SizedBox(
              width: 18,
            ),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: _setTextColor(messageType),
                ),
              ),
            ),
            InkWell(
              onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              child: Icon(
                Icons.close,
                size: 20,
                color: _setTextColor(messageType),
              ),
            ),
          ],
        ),
        backgroundColor: _setBgColor(messageType),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      ),
    );
  }

  static _setBgColor(MessageType messageType) {
    switch (messageType) {
      case MessageType.success:
        return AppColors.success;
      case MessageType.error:
        return AppColors.error;
      case MessageType.warning:
        return AppColors.warning;
      default:
        return AppColors.text;
    }
  }

  static Color _setTextColor(MessageType messageType) {
    switch (messageType) {
      case MessageType.success:
        return AppColors.text;
      case MessageType.error:
        return Colors.white;
      case MessageType.warning:
        return AppColors.text;
      default:
        return AppColors.text;
    }
  }

  static IconData _setIconData(MessageType messageType) {
    switch (messageType) {
      case MessageType.success:
        return Icons.check_circle;
      case MessageType.error:
        return Icons.cancel;
      case MessageType.warning:
        return Icons.warning;
      default:
        return Icons.check_circle;
    }
  }
}
